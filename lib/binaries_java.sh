install_java() {
  local version="$1"
  local dir="$2"
  
  local download_url="http://download.oracle.com/otn-pub/java/jdk/10.0.1+10/fb4372174a714e6b8c52526dc134031e/jdk-10.0.1_linux-x64_bin.tar.gz"
  echo "Downloading JAVA [$download_url]"
  curl -v -j -k -L -H "Cookie: oraclelicense=accept-securebackup-cookie" "$download_url" -o /tmp/java.tar.gz || (echo "Unable to download java; does it exist?" && false)
  echo "Download complete!"

  echo "Installing JAVA"
  mkdir /tmp/jdk
  mkdir $dir
  tar xzf /tmp/java.tar.gz -C /tmp/jdk
  rm -rf $dir/*
  mv /tmp/jdk/jdk-10.0.1/* $dir
  chmod +x $dir/bin
  PATH=$dir/bin:$PATH
  echo $PATH
  echo $dir
  ls $dir/bin
  echo "Installation complete!"	
}
