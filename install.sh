
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

echo "linking bash config files"
for f in "bashrc" "bash_profile"; do 
  if [[ -f $HOME/.${f} ]]; then
    echo "Saving $HOME/.$f to $HOME/.$f.bak"
    mv $HOME/.${f} $HOME/.${f}.bak
  fi
  ln -s $SCRIPT_DIR/$f $HOME/.$f
done

echo "linking aliases"
if [[ -d $HOME/.dev-config ]]; then
  echo "Saving $HOME/.dev-config to $HOME/.dev-config.bak"
  mv $HOME/.dev-config $HOME/.dev-config.bak
fi
ln -s $SCRIPT_DIR/dev-config $HOME/.dev-config


echo "linking tmux"
if [[ -d $HOME/.tmux.conf.d ]]; then
  echo "Saving $HOME/.tmux.conf.d to $HOME/.tmux.conf.d.bak"
  mv $HOME/.tmux.conf.d $HOME/.tmux.conf.d.bak
fi
ln -s $SCRIPT_DIR/tmux.conf.d $HOME/.tmux.conf.d

if [[ -f $HOME/.tmux.conf ]]; then
  echo "Saving $HOME/.tmux.conf to $HOME/.tmux.conf.bak"
  mv $HOME/.tmux.conf $HOME/.tmux.conf.bak
fi
ln -s $SCRIPT_DIR/tmux.conf $HOME/.tmux.conf

