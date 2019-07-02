function usage() {
    echo "Usage: mvn-clean-recursive.sh [projects directory]"
}

echo "Welcome to my simple 'Multiple Maven projects clean script!"
usage

DIRECTORY=$1
USERNAME=$2
USEREMAIL=$3

CURRENT_DIRECTORY="$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )"

echo "Scripts directory is: $CURRENT_DIRECTORY"

if [[ ! -d "$DIRECTORY" ]]; then
    echo "'$DIRECTORY' is not a directory!"
    usage
    exit
fi

cd $DIRECTORY

echo "Searching projects directories in '$(pwd)' ..."

dirs=$(ls -d */ | grep -e '\S')
for s in $dirs
do
    cd $s
    count=`ls pom.xml 2>/dev/null | wc -l`
    if [ $count != 0 ]; then
      echo "Cleaning project '$(pwd)'"
      mvn clean
    else
      echo "No Maven project found in '$(pwd)'"
    fi
    cd ..
done
