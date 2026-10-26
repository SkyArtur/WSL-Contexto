if [ -f "$HOME/.ssh/id_ed25519" ]; then
  eval "$(ssh-agent -s)"
  ssh-add ~/.ssh/id_ed25519
fi