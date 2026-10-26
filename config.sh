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
DOCUMENTS="$HOME/Documents"
PROJECTS_BIN="$HOME/.projects/bin"
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


case "$OS_RELEASE" in
  ubuntu)
    echo "Executando configurações para Ubuntu..."
    apt-get update
    apt-get upgrade -y
    printf '\n%s\n' "$SOURCE_LINE" >> "$BASHRC"
    echo "Linha adicionada ao .bashrc"
    ;;
  fedora)
    echo "Configurando o ambiente Fedora..."
    dnf check-update
    dnf upgrade -y
    ;;
  *)
    echo "Sistema não suportado: $ID"
    exit 1
    ;;
esac

criar_diretorio "$PROJECTS"
criar_diretorio "$DOWNLOADS"
criar_diretorio "$DOCUMENTS"
criar_diretorio "$PROJECTS_BIN"
criar_diretorio "$DOWNLOADS/lotomania"

if [ -d "$PROJECTS" ]; then
  mv "./api_lotomania" "$PROJECTS/api_lotomania"
  mv "./update_lotomania" "$PROJECTS/update_lotomania"
  echo "api_lotomania movida para $PROJECTS/api_lotomania"
  echo "update_lotomania movida para $PROJECTS/api_lotomania"
fi



