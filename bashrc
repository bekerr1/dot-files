echo Hi Brendan, from .bashrc
alias sbrc="source ~/.bashrc"
alias vbrc="vim ~/.bashrc"

PS1="\[\033[38;5;7m\][\[$(tput sgr0)\]\[\033[38;5;9m\]\h\[$(tput sgr0)\]\[\033[38;5;7m\]]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;7m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;9m\]$\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"
source $HOME/.dev-config/aliases
source $HOME/.dev-config/kube_aliases
source $HOME/.dev-config/screen_aliases
source $HOME/.dev-config/git_aliases
source $HOME/.dev-config/quark_aliases
source $HOME/.dev-config/gcloud_aliases
source $HOME/.dev-config/seclab_aliases
source $HOME/.dev-config/cri_aliases

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
export USER=brendank

export USE_GKE_GCLOUD_AUTH_PLUGIN=True
export CLOUDSDK_PYTHON=$HOME/bin/python

function config() {
    if [ -z "$1" ]; then
	export KUBECONFIG="$HOME/.kube/config"
	return
    fi
    export KUBECONFIG="$HOME/.kube/config.$1"
}

#if [ ! -f /etc/sysconfig/bash-prompt-screen ]; then
#    if sudo -v && sudo touch /etc/sysconfig/bash-prompt-screen; then
#        sudo chmod +x /etc/sysconfig/bash-prompt-screen
#    fi
#fi


### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/brendankerr/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
export PATH="/Users/brendankerr/.krew/bin:$PATH"
