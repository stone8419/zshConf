# bash_profile
if brew list | grep coreutils > /dev/null ; then
  PATH="$(brew --prefix coreutils)/libexec/gnubin:${PATH}"
  alias ls='ls -F --show-control-chars --color=auto'
  eval `gdircolors -b $HOME/.dir_colors`
fi

#GO Config
export GOROOT=/usr/local/go
export GOBIN=$GOROOT/bin
#export PATH=${PATH}:${GOROOT}/bin
export GOPATH=~/workplace/godevelop
