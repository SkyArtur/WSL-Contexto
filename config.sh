#!/usr/bin/env bash

if [ -f /etc/os-release ]; then
  source /etc/os-release
fi

OS_RELEASE="$ID"
BASHRC="$HOME/.bashrc"
BASHRC_D="$HOME/.bashrc.d"
BASHRC_CONFIG="./bashrc_config/.bashrc.d"
PROJECTS="$HOME/Projects"
DOWNLOADS="$HOME/Downloads"
SOURCE_LINE="source $HOME/.bashrc.d/bashrc"

criar_diretorio() {
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

criar_diretorio "$DOWNLOADS/lotomania"

if [ -d "$PROJECTS" ]; then
  mv "./api_lotomania" "$PROJECTS/api_lotomania"
  mv "./update_lotomania" "$PROJECTS/update_lotomania"
  echo "api_lotomania movida para $PROJECTS/api_lotomania"
  echo "update_lotomania movida para $PROJECTS/api_lotomania"
fi



