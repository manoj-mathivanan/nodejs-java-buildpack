install_java() {
  local version="$1"
  local dir="$2"
  pwd
  local download_url="http://download.oracle.com/otn-pub/java/jdk/10.0.1+10/fb4372174a714e6b8c52526dc134031e/jdk-10.0.1_linux-x64_bin.tar.gz"
  echo "Downloading JAVA [$download_url]"
  curl -v -j -k -L -H "Cookie: oraclelicense=accept-securebackup-cookie" "$download_url" -o /home/vcap/tmp/java.tar.gz || (echo "Unable to download java; does it exist?" && false)
  echo "Download complete!"

  echo "Installing JAVA"
  rm -rf /home/vcap/tmp/jdk
  mkdir /home/vcap/tmp/jdk
  tar xzf /home/vcap/tmp/java.tar.gz -C /home/vcap/tmp/jdk
  chmod +x /home/vcap/tmp/jdk/bin
  JAVA_HOME=/home/vcap/tmp/jdk
  PATH=/home/vcap/tmp/jdk/bin:$PATH
  echo $PATH
  ls /home/vcap/tmp/jdk/bin
  echo "Installation complete!"	
}
