SSHKEY="$HOME/.ssh/id_ed25519"


if [ -f "$SSHKEY" ]; then
  init-sshkey() {
    eval "$(ssh-agent -s)"
    ssh-add "$SSHKEY"
  }
fi