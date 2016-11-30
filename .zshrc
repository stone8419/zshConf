# Path to your oh-my-zsh installation.
export ZSH=${HOME}/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="paladin"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git brew npm mvn docker docker-machine)

source ${ZSH}/oh-my-zsh.sh

# User configuration

export PATH="/usr/local/opt/coreutils/libexec/gnubin:${HOME}/bin:/opt/local/bin:/opt/local/sbin:${PATH}"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# bash_profile
if brew list | grep coreutils > /dev/null ; then
#  PATH="$(brew --prefix coreutils)/libexec/gnubin:${PATH}"
  alias ls='ls -F --show-control-chars --color=auto'
  eval `gdircolors -b $HOME/.dir_colors`
fi

# GO Config
export GOROOT=/usr/local/go
#export GOROOT=/usr/local/opt/go/libexec
export GOBIN=$GOROOT/bin
export PATH=${PATH}:${GOROOT}/bin
export GOPATH=~/workplace/godev
#export GOPATH=$GOPATH:~/Paxos

# MySql Config
#alias mysqlstart='sudo /Library/StartupItems/MySQLCOM/MySQLCOM restart'
#alias mysql='/usr/local/mysql/bin/mysql'
alias mysql='/Applications/AMPPS/mysql/bin/mysql'
alias mysqladmin='/Applications/AMPPS/mysql/bin/mysqladmin'
#alias mysqladmin='/usr/local/mysql/bin/mysqladmin'

# Zookeeper Config
export ZOOKEEPER_HOME=/Users/paladintyrion/zookeeper/zookeeper-3.4.6
#export PATH=$ZOOKEEPER_HOME/bin:$PATH

#HADOOP Config
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_102.jdk/Contents/Home
export JRE_HOME=${JAVA_HOME}/jre
export CLASSPATH=.:$JAVA_HOME/lib:$JRE_HOME/lib:$CLASSPATH

export HADOOP_HOME=/Users/paladintyrion/src/src/hadoop-2.6.4
export PATH=${PATH}:${HADOOP_HOME}/bin:${HADOOP_HOME}/sbin
export HADOOP_CONF_DIR=${HADOOP_HOME}/etc/hadoop
export YARN_CONF_DIR=${HADOOP_CONF_DIR}
#export HADOOP_ROOT_LOGGER=INFO,console
export HADOOP_COMMON_LIB_NATIVE_DIR=${HADOOP_HOME}/lib/native
export HADOOP_OPTS="-Djava.library.path=${HADOOP_HOME}/lib/native"
export LD_LIBRARY_PATH=${HADOOP_HOME}/lib/native:$LD_LIBRARY_PATH
#HIVE Config
export HIVE_HOME=/Users/paladintyrion/src/src/apache-hive-2.1.0-bin
export PATH=${PATH}:${HIVE_HOME}/bin

#Scala Config
export SCALA_HOME=/Users/paladintyrion/src/src/scala/scala-2.10.6
export PATH=$PATH:$SCALA_HOME/bin
export SBT_OPTS="-Xms512M -Xmx1536M -Xss1M -XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=256M"
export SBT_HOME=/Users/paladintyrion/src/src/scala/sbt
export PATH=$PATH:$SBT_HOME/bin

#Spark Config
export SPARK_HOME=/Users/paladintyrion/src/src/Spark/spark-2.0.1-bin-hadoop2.7
export PATH=$PATH:$SPARK_HOME/bin:$SPARK_HOME/sbin
export MAVEN_OPTS="-Xmx3g -XX:MaxPermSize=1g -XX:ReservedCodeCacheSize=1g"

#GCC/G++
#alias g++='/usr/local/opt/gcc/bin/g++-6'
#alias gcc='/usr/local/opt/gcc/bin/gcc-6'

# Bash Completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  $(brew --prefix)/etc/bash_completion
fi

# for tikv env
rocksdb_dir=$HOME/.cache/rocksdb
#if [[ "$need_rebuild" == "true" ]] && [[ ! -d "$rocksdb_dir" ]]; then 
#  mkdir -p $rocksdb_dir;
#fi
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$rocksdb_dir"
export LIBRARY_PATH="$LD_LIBRARY_PATH"

#etcd Config
export ETCDCTL_API=3

# wine start sourcesight
alias sight='wine "C:\sourcesight\Insight3.exe"'

#go path
alias cdgo='cd $GOPATH/src'
alias cdwp='cd ~/workplace'

VIM=~/.vim
