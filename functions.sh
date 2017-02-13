# Search source files for a string
# https://www.linux.com/learn/intro-to-linux/finding-interesting-documents-grep
# Params
#   $1 - search string
C_FIND() {
    if [ $# -lt 1 ]; then
        echo "RGSRC: Needs argument"
        echo "usage: RGSRC <string to search for>"
        return 1
    fi
    find . \( -name "*.hh" -o -name "*.cpp" -o -name "*.hpp" -o -name "*.h" -o -name "*.c" \) \
        -exec grep -Hn "$1" {} +
}
