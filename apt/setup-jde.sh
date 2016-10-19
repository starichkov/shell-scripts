echo "Welcome to my Java Development Environment setup script!"
# unpacking archives
DIRECTORY=~/Development/bin
if [ ! -d "$DIRECTORY" ]; then
  mkdir -p $DIRECTORY
fi
echo "Unpacking archives..."
sudo tar -zxf ideaIU-2016.2.4.tar.gz -C /usr/local
sudo tar -zxf jdk-8u101-linux-x64.tar.gz -C /usr/local
tar -zxf apache-tomcat-8.0.37.tar.gz -C  ~/Development/bin
tar -zxf apache-maven-3.2.5-bin.tar.gz -C ~/Development/bin
tar -zxf apache-maven-3.3.3-bin.tar.gz -C ~/Development/bin
# set up java binaries
echo "Removing OpenJDK..."
sudo apt-get purge openjdk*
echo "Setting up 'java' binary..."
sudo update-alternatives --install "/usr/bin/java" "java" "/usr/local/jdk1.8.0_101/bin/java" 1
sudo update-alternatives --set java /usr/local/jdk1.8.0_101/bin/java
java -version
echo "Setting up 'javac' binary..."
sudo update-alternatives --install "/usr/bin/javac" "javac" "/usr/local/jdk1.8.0_101/bin/javac" 1 
sudo update-alternatives --set javac /usr/local/jdk1.8.0_101/bin/javac
javac -version
echo "Setting up 'javaws' binary..."
sudo update-alternatives --install "/usr/bin/javaws" "javaws" "/usr/local/jdk1.8.0_101/bin/javaws" 1 
sudo update-alternatives --set javaws /usr/local/jdk1.8.0_101/bin/javaws
javaws -version
echo "Setting up 'jar' binary..."
sudo update-alternatives --install "/usr/bin/jar" "jar" "/usr/local/jdk1.8.0_101/bin/jar" 1 
sudo update-alternatives --set jar /usr/local/jdk1.8.0_101/bin/jar
jar -version
echo "Installing Git..."
sudo apt-get install git
git --version
