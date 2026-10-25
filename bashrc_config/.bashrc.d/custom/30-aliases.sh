alias py="python3"
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Atalhos de navegação e busca que preservam os argumentos fornecidos.
alias ..='cd ..'
alias ...='cd ../..'

# Atalhos de navegação e busca que preservam os argumentos fornecidos e conveniências.
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
