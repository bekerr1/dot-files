SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"

# These might be common and saving them is more simple than all the others
echo "linking bash config files"
for f in "bashrc" "bash_profile"; do
  if [[ -f $HOME/.${f} ]]; then
    echo "Saving $HOME/.$f to $HOME/.$f.bak"
    mv $HOME/.${f} $HOME/.${f}.bak
  fi
  ln -s $SCRIPT_DIR/bash/$f $HOME/.$f
done

echo "linking aliases"
if [[ -d $HOME/.dev-config ]]; then
  echo "Not overriding current $HOME/.dev-config"
else
  ln -s $SCRIPT_DIR/dev-config $HOME/.dev-config
fi

echo "linking tmux"
if [[ -d $HOME/.tmux.conf.d ]]; then
  echo "Not overriding current $HOME/.tmux.conf.d"
else
  ln -s $SCRIPT_DIR/tmux/tmux.conf.d $HOME/.tmux.conf.d
fi
if [[ -f $HOME/.tmux.conf ]]; then
  echo "Not overriding current $HOME/.tmux.conf"
else
  ln -s $SCRIPT_DIR/tmux/tmux.conf $HOME/.tmux.conf
fi

echo "linking nvim"
if [[ -d $HOME/.config/nvim ]]; then
  echo "Not overriding current $HOME/.config/nvim"
else
  ln -s $SCRIPT_DIR/brendank-nvim $HOME/.config/nvim
fi
