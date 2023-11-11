echo Hi from .bash_profile

source $HOME/.alias
source $HOME/.bashrc
export TERM=xterm-256color

alias f=fg_
alias j=jobs

fg_() {
    fg %$1
}

alias cwd=cwd_
cwd_() {
    MATCHES=$(ls ~/bam | grep $1 | wc -w)
    if [ $MATCHES -gt 1 ]; then
        echo "Multiple outputs from grep. Be more specific"
        return
    fi
    DIR=$(ls ~/bam | grep $1)
    CUR_PATH=$(pwd | cut -d / -f 6-)
    DEST="$HOME/bam/$DIR/$CUR_PATH"
    echo "Now Entering $DEST"
    cd $DEST
}
# added by Miniconda3 4.5.12 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/Users/brendankerr/miniconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/Users/brendankerr/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/brendankerr/miniconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/Users/brendankerr/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/brendankerr/Downloads/google-cloud-sdk/path.bash.inc' ]; then . '/Users/brendankerr/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/brendankerr/Downloads/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/brendankerr/Downloads/google-cloud-sdk/completion.bash.inc'; fi

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/brendankerr/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)