#!/usr/bin/env bash

if [ -f /etc/os-release ]; then
  source /etc/os-release
fi

OS_RELEASE="$ID"
BASHRC="$HOME/.bashrc"
BASHRC_D="$HOME/.bashrc.d"
BASHRC_CONFIG="./bashrc_config/.bashrc.d"
PROJECTS="$HOME/Projetos"
DOWNLOADS="$HOME/Downloads"
SOURCE_LINE="source $HOME/.bashrc.d/bashrc"

create_dir() {
  local diretorio="$1"
  mkdir -p "$diretorio"
  if [ -d "$diretorio" ]; then
    echo "Diretório $diretorio criado com sucesso"
  fi
}

if [ ! -d "$BASHRC_D" ]; then
  mv "$BASHRC_CONFIG" "$BASHRC_D"
  echo "Movido .bashrc.d para a HOME"
else
  echo "Diretório .bashrc.d já existe em HOME"
fi

if [ "$OS_RELEASE" = "ubuntu" ]; then
  printf '\n%s\n' "$SOURCE_LINE" >> "$BASHRC"
  echo "Linha adicionada ao .bashrc"
fi

create_dir "$DOWNLOADS/lotomania"

if [ -d "$PROJECTS" ]; then
  sudo mv "./api_lotomania" "$PROJECTS/api_lotomania"
  sudo mv "./update_lotomania" "$PROJECTS/update_lotomania"
  echo "api_lotomania movida para $PROJECTS/api_lotomania"
  echo "update_lotomania movida para $PROJECTS/api_lotomania"
fi



