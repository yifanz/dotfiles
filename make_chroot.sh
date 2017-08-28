#!/bin/bash

chroot_dir="$1"

# Binaries we want in the chroot
bins=(
"/bin/bash"
"/bin/cat"
"/bin/chmod"
"/bin/["
"/bin/bash"
"/bin/cat"
"/bin/chmod"
"/bin/cp"
"/bin/csh"
"/bin/date"
"/bin/dd"
"/bin/df"
"/bin/domainname"
"/bin/echo"
"/bin/ed"
"/bin/expr"
"/bin/hostname"
"/bin/kill"
"/bin/ksh"
"/bin/launchctl"
"/bin/link"
"/bin/ln"
"/bin/ls"
"/bin/mkdir"
"/bin/mv"
"/bin/pax"
"/bin/ps"
"/bin/pwd"
"/bin/rcp"
"/bin/rm"
"/bin/rmdir"
"/bin/sh"
"/bin/sleep"
"/bin/stty"
"/bin/sync"
"/bin/tcsh"
"/bin/test"
"/bin/unlink"
"/bin/wait4path"
"/bin/zsh"
)

# Array of dependent dylibs
deps=()

array_contains()
{
    local array="$1[@]"             # so that we can pass the array by its name
    local value=$2
    local found=1

    for item in "${!array}"; do      # {!array} indirect dereference
        if [[ $value == $item ]]; then
            found=0
            break
        fi
    done

    return $found
}

find_deps()
{
    local bin=$1
    while read lib; do
        lib=${lib%%\(*\)}           # remove version info
        lib=${lib%%[[:space:]]}     # remove trailing spaces
        lib=${lib##[[:space:]]}     # remove leading sapces
        if ! array_contains deps $lib; then
            deps+=("$lib")
            find_deps "$lib"
        fi
    # Use process substitution. If we used pipe, a subshell will be created
    # and we won't be able to mutate parent shell variables.
    done < <(otool -L "$bin" | tail -n +2)
}

print_array()
{
    local array="$1[@]"

    for item in "${!array}"; do
        echo "$item"
    done
}

echo "Making chroot at $chroot_dir..."
mkdir -p "$chroot_dir"
if [[ ! $? -eq 0 ]]; then
    echo "Failed to make chroot dir"
    exit 1
fi

for bin in `find /usr/bin -type f`; do
    bins+=( "$bin" )
done

for bin in "${bins[@]}"; do
    find_deps "$bin"
done

print_array deps
exit

# Copy binaries into chroot
for bin in "${bins[@]}"; do
    rsync -R "$bin" "$chroot_dir"   # copy along with parent directories
done

# Copy dependencies into chroot
for dep in "${deps[@]}"; do
    rsync -R "$dep" "$chroot_dir"   # copy along with parent directories
done

#print_array deps
echo "${#deps}"
