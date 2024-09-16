tput cup 9999 0

echo Hi Brendan, from .bashrc
alias sbrc="source ~/.bashrc"
alias vbrc="vim ~/.bashrc"

PS1="\[\033[38;5;7m\][\[$(tput sgr0)\]\[\033[38;5;9m\]\h\[$(tput sgr0)\]\[\033[38;5;7m\]]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;7m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;9m\]$\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"

for f in ~/.dev-config/*; do source $f; done

export TERM=xterm-256color
export GOROOT="/usr/local/go"
export GOPATHBIN="/usr/local/go/bin"

export BR_BROCK=0

export GOPATH="$HOME/go"
if [ "$HOSTNAME" == "b3k3r-ubuntu1" ]; then
    export GOPATH="$HOME/Development/go"
fi

export GOBIN="$GOPATH/bin"
#export GOROOT="/usr/lib/golang"
export GO111MODULES=on
#export GOPROXY=https://go.repo.eng.netapp.com
#export GOPROXY=file:///x/eng/bbrtp60/users/brendank/A_6236583_02_090_01_6239258_2201131201/third_party/open_source/goproxy/pkg/mod/cache/download
export PATH="$PATH:$GOPATHBIN:$GOBIN"
export PATH="/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.local/bin/:$PATH"
export PATH="$PATH:/usr/software/bin"
export PATH="$PATH:/usr/software/rats/bin/"
export PATH="$PATH:/opt/homebrew/bin"
export USER=brendank

export USE_GKE_GCLOUD_AUTH_PLUGIN=True
export CLOUDSDK_PYTHON=python3

#if [ ! -f /etc/sysconfig/bash-prompt-screen ]; then
#    if sudo -v && sudo touch /etc/sysconfig/bash-prompt-screen; then
#        sudo chmod +x /etc/sysconfig/bash-prompt-screen
#    fi
#fi


### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/brendank/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
export PATH="$HOME/.krew/bin:$PATH"

alias vim='nvim'

# The next line updates PATH for the Google Cloud SDK.
if [ -f '$HOME/google-cloud-sdk/path.bash.inc' ]; then . '$HOME/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '$HOME/google-cloud-sdk/completion.bash.inc' ]; then . '$HOME/google-cloud-sdk/completion.bash.inc'; fi

cat $HOME/.bashintro.txt
