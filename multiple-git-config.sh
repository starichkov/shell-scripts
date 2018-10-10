function usage() {
    echo "Usage: tree-git-config.sh [projects directory] [user name] [user email]"
}

echo "Welcome to my simple 'Multiple projects local Git configuration' script!"
usage

DIRECTORY=$1
USERNAME=$2
USEREMAIL=$3

CURRENT_DIRECTORY="$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )"
GIT_CONFIG_SCRIPT="$CURRENT_DIRECTORY/git-config.sh"

echo "Scripts directory is: $CURRENT_DIRECTORY"
echo "git-config script is: $GIT_CONFIG_SCRIPT"

if [[ ! -d "$DIRECTORY" ]]; then
    echo "'$DIRECTORY' is not a directory!"
    usage
    exit
fi

if [[ "$USERNAME" = '' ]]; then
    echo "User email should not be empty!"
    usage
    exit
fi

if [[ "$USEREMAIL" = '' ]]; then
    echo "User email should not be empty!"
    usage
    exit
fi

echo "Configuring local Git with user '$USERNAME' '$USEREMAIL' for each project in directory $DIRECTORY..."

cd $DIRECTORY

echo "Searching projects directories in '$(pwd)' ..."

dirs=$(ls -d */ | grep -e '\S')
for s in $dirs
do
    cd $s
    echo "Configuring project '$(pwd)'"
    $GIT_CONFIG_SCRIPT 'local' "$USERNAME" "$USEREMAIL"
    cd ..
done
