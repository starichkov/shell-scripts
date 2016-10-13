echo "Welcome to my simple 'git config' script!"

OPTIONS="local global system"
OPTION=$1
USERNAME=$2
USEREMAIL=$3

# we need exactly 3 arguments
if [ "$#" -ne 3 ]; then
    echo "You must enter exactly 3 arguments"
    exit
fi

# check if selected option is in list
isInvalidOption() {
    for word in $OPTIONS; do
        [[ $word = $OPTION ]] && return 1
    done
    return 0
}

if isInvalidOption; then
    echo "Invalid type. Please check a valid one: $OPTIONS"
    exit
fi

git config --$OPTION user.name "$USERNAME"
git config --$OPTION user.email $USEREMAIL

echo "Commands executed:"
echo "git config --$OPTION user.name \"$USERNAME\""
echo "git config --$OPTION user.email $USEREMAIL"
