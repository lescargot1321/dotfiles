# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

export EDITOR='vim'
export MANPAGER='less'
export VISUAL='vim'

# Support colors in less
 #export LESS_TERMCAP_mb=$'\e[1;31m'
 #export LESS_TERMCAP_md=$'\e[1;31m'
 #export LESS_TERMCAP_me=$'\e[0m'
 #export LESS_TERMCAP_se=$'\e[0m'
 #export LESS_TERMCAP_so=$'\e[1;33;44m'
 #export LESS_TERMCAP_ue=$'\e[0m'
 #export LESS_TERMCAP_us=$'\e[4;1;32m'
 #export LESS_TERMCAP_mr=$'\e[7m'
 #export LESS_TERMCAP_mh=$'\e[2m'

# Support colors in less tput version
  #export LESS_TERMCAP_mb=$(tput bold; tput setaf 1)
  #export LESS_TERMCAP_md=$(tput bold; tput setaf 1)
  #export LESS_TERMCAP_me=$(tput sgr0)
  #export LESS_TERMCAP_se=$(tput sgr0)
  #export LESS_TERMCAP_so=$(tput bold; tput setaf 3; tput setab 4)
  #export LESS_TERMCAP_ue=$(tput sgr0)
  #export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 2)
  #export LESS_TERMCAP_mr=$(tput rev)
  #export LESS_TERMCAP_mh=$(tput dim)


# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

shopt -s histappend
shopt -s checkwinsize # check the window size after each command

# enable bash completion in interactive shells
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# make less more friendly for non-text input files, see lesspipe(1)
  #[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

force_color_prompt=yes # uncomment for a colored prompt

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48 (ISO/IEC-6429)
   color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
  #case "$TERM" in
  #xterm*|rxvt*)
  #    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
  #    ;;
  #*)
  #    ;;
  #esac

# ZE ONE ?
PS1='\[\e[38;5;205m\]\u@\h\[\e[0m\] \[\e[38;5;214m\]/\W\[\e[0m\] \[\e[38;5;255m\]\\$\[\e[0m\] '

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# In case .bash_aliases one day exists
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Aliases
alias convertx='docker compose up -p lescargot -f ~/convertx-config/docker-compose.yml'
alias fix-kana='/usr/local/bin/disable-kana-buttons-autostart.sh'
alias yt-format='yt-dlp --cookies-from-browser firefox -F'
alias yt-formatdl='yt-dlp --cookies-from-browser firefox -f'

# Cargo_related |:-)
export PATH="$HOME/.local/bin:$PATH"
. "/home/lescargot/.deno/env"
. "$HOME/.cargo/env"

# tldr
export PATH="$HOME/.cargo/bin/tldr:$PATH"

# Test fix autocomplete
bind '"\t":menu-complete'

