#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#


# Customize to your needs...


# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

export PATH=$PATH:$HOME/bin:/home/orco/.gem/ruby/2.1.0/bin:/home/orco/bin

#PATH per $mail
#MAIL=~/.mail
#mailpath=($mail/roorco/inbox/)
# vi key mode
#bindkey -v
bindkey "\e[3~" delete-char
bindkey "^R" history-incremental-search-backward

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
[[ -z "$TMUX" ]]

#PS1='[\u@\h \W]\$ '
#export PS1='\[\033[01;32m\]\u@\h \[\033[00;31m\]\W \$ \[\033[00m\]'
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim

TERM=screen-256color
alias t="task"
alias ta="task add"
alias tl="task list"
alias ls="ls -h --color=auto"
## Modified commands ## {{{
alias diff='colordiff'              # requires colordiff package
alias grep='grep --color=auto'
alias more='less'
alias df='df -h'
alias du='du -c -h'
alias mkdir='mkdir -p -v'
alias nano='nano -w'
alias ping='ping -c 5'
alias dmesg='dmesg -HL'
# }}}
## New commands ## {{{
alias da='date "+%A, %B %d, %Y [%T]"'
alias du1='du --max-depth=1'
alias hist='history | grep'         # requires an argument
alias openports='ss --all --numeric --processes --ipv4 --ipv6'
alias pgg='ps -Af | grep'           # requires an argument
alias ..='cd ..'
# }}}
# Privileged access
if [ $UID -ne 0 ]; then
    alias sudo='sudo '
    alias scat='sudo cat'
    alias svim='sudoedit'
    alias root='sudo -s'
    alias reboot='systemctl reboot'
    alias poweroff='systemctl poweroff'
    alias hibernate='systemctl hibernate'
    alias suspend='systemctl suspend'
    alias netctl='sudo netctl'
# Pacman alias examples
alias pacupg='sudo pacman -Syu'		# Synchronize with repositories and then upgrade packages that are out of date on the local system.
alias pacin='sudo pacman -S'		# Install specific package(s) from the repositories
alias pacins='sudo pacman -U'		# Install specific package not from the repositories but from a file 
alias pacre='sudo pacman -R'		# Remove the specified package(s), retaining its configuration(s) and required dependencies
alias pacrem='sudo pacman -Rns'		# Remove the specified package(s), its configuration(s) and unneeded dependencies
alias pacrep='pacman -Si'		# Display information about a given package in the repositories
alias pacreps='pacman -Ss'		# Search for package(s) in the repositories
alias pacloc='pacman -Qi'		# Display information about a given package in the local database
alias paclocs='pacman -Qs'		# Search for package(s) in the local database
alias paclo="pacman -Qdt"		# List all packages which are orphaned
alias pacc="sudo pacman -Scc"		# Clean cache - delete all not currently installed package files
alias paclf="pacman -Ql"		# List all files installed by a given package
alias pacexpl="pacman -D --asexp"	# Mark one or more installed packages as explicitly installed 
alias pacimpl="pacman -D --asdep"	# Mark one or more installed packages as non explicitly installed
alias pac="/usr/bin/packer -S --noconfirm"		# default action	- install one or more packages
alias pacu="/usr/bin/packer -Syu"		# '[u]pdate'		- upgrade all packages to their newest version
alias pacr="sudo /usr/bin/pacman -Rns"		# '[r]emove'		- uninstall one or more packages
# '[r]emove [o]rphans' - recursively remove ALL orphaned packages
alias pacro="sudo pacman -Rns $(pacman -Qqtd)"
fi

## Safety features ## {{{
alias cp='cp -v -i'
alias mv='mv -v -i'
alias rm='rm -v'
#alias rm='rm -v -I'                    # 'rm -i' prompts for every file
# safer alternative w/ timeout, not stored in history
#alias rm=' timeout 3 rm -Iv --one-file-system'
alias ln='ln -i'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'
alias cls=' echo -ne "\033c"'       # clear screen for real (it does not work in Terminology)
# }}}

## ls ## {{{
alias ls='ls -hF --color=auto'
alias lr='ls -R'                    # recursive ls
alias ll='ls -l'
alias la='ll -A'
alias lx='ll -BX'                   # sort by extension
alias lz='ll -rS'                   # sort by size
alias lt='ll -rt'                   # sort by date
alias lm='la | more'
# }}}
## Make Bash error tolerant ## {{{
alias :q=' exit'
alias :Q=' exit'
alias :x=' exit'
alias cd..='cd ..'
# }}}
#Tmux aliases
alias tmx="tmux -2"
alias tmx0='tmux attach -d -t 0'
alias tmxa='tmux attach -d -t ALL'
alias tmxt='tmux attach-session -t'
alias tmxl='tmux list-sessions'
alias tmxk='tmux kill-session -t'

#google contacts
alias googlc="google contacts list"
#}}}

# cd and ls in one
cl() {
    dir=$1
    if [[ -z "$dir" ]]; then
        dir=$HOME
    fi
    if [[ -d "$dir" ]]; then
        cd "$dir"
        ls
    else
        echo "bash: cl: '$dir': Directory not found"
    fi
}

# enviroment variable for gpg-agent
#if [ -f "${HOME}/.gpg-agent-info" ]; then
#    . "${HOME}/.gpg-agent-info"
#    export GPG_AGENT_INFO
#fi


#cambia dinamicamente nome al terminale
#if [ $TERM = xterm ] ; then
#	    unset PROMPT_COMMAND
#    fi
