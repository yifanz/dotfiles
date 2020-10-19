# Search source files for a string
# https://www.linux.com/learn/intro-to-linux/finding-interesting-documents-grep
# Params
#   $1 - search string
rgsrc() {
    if [ $# -lt 1 ]; then
        echo "rgsrc: Needs argument"
        echo "usage: rgsrc <pattern to search for>"
        return 1
    fi
    find . \( -name "*.hh" -o -name "*.cpp" -o -name "*.hpp" -o -name "*.h" -o -name "*.c" -o -name "*.m" \
        -o -name "*.sh" -o -name "Makefile" \) \
        -exec grep -Hn "$1" {} +
}

# Keep computer awake for 8 hours
stay_awake() {
    caffeinate -d -u -i -s -t 28800 &
}
