export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

export GOPATH=$HOME/work/go
export PATH=$PATH:$GOPATH/bin

export PATH=$PATH:~/bin/tools-osx 

# Home macbook PATHs ---------
export PATH="/Users/Daly/Documents/School/EECS/Downloads/Frameworks/android-sdk-macosx/tools":"$PATH"
export PATH="/Users/Daly/Documents/School/EECS/Downloads/Frameworks/android-sdk-macosx/platform-tools":"$PATH"
export PATH="/Users/Daly/Documents/School/EECS/Downloads/Frameworks/android-ndk-r10e":"$PATH"

export ANDROID_HOME="/Users/Daly/Documents/School/EECS/Downloads/Frameworks/android-sdk-macosx/"
export NDK_MODULE_PATH="$ANDROID_HOME"/..

# remove google3 JDK /usr/local/buildtools/java/jdk/bin from PATH
export PATH=${PATH/\/usr\/local\/buildtools\/java\/jdk\/bin:/}

