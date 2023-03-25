#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export EDITOR=micro
export LESSHISTFILE=""
export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export GOPATH=$XDG_DATA_HOME/go
export KDEHOME=$XDG_CONFIG_HOME/KDE
export CARGO_HOME=$XDG_DATA_HOME/cargo
export PNPM_HOME=$XDG_DATA_HOME/pnpm
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export GPG_TTY=$(tty)

export PATH=$PATH:$CARGO_HOME/bin:$PNPM_HOME:/home/orchid/.local/bin

# Modrinth
export APIURL="https://api.modrinth.com/v2"
alias authr='curl -isH "Content-type: application/json" -H "Authorization:$MODRINTH_TOKEN"'
alias mpatch='authr -X PATCH --data-raw'
alias r='packerator'
export NUXT_TELEMETRY_DISABLED=1
export RATE_LIMIT_IGNORE_KEY=foobar
export NODE_OPTIONS=--openssl-legacy-provider

# General
alias ls='ls -shal --color=auto'
alias c='clear'
alias m='micro'
alias p='paru'
alias x='exit'
alias d.='dolphin .'
alias libs='cd build/libs && dolphin . && cd ../..'
alias op='oxipng -o max ./*.png'

# Git
alias g='git'
alias gc='git commit'
alias ca='git commit -a'
alias cam='git commit -am'
alias ri='git rebase -i'
alias po='git push origin'
alias pom='git push origin && git push mirror'
alias pm='git push mirror'

# Packwiz
alias z='packwiz'
alias mr='packwiz mr install'
alias cf='packwiz cf install'
alias cdp='cd /home/orchid/repos/misc/website/packwiz/'

function color_prompt {
    local user_and_host="\[\033[01;32m\]\u"
    local cur_location="\[\033[01;34m\]\w"
    local git_branch_color="\[\033[31m\]"
    local git_branch='`git branch 2> /dev/null | grep -e ^* | sed -E s/^\\\\\*\ \(.+\)$/\(\\\\\1\)\ /`'
    local prompt_tail="\[\033[35m\]$"
    local last_color="\[\033[00m\]"
    export PS1="$user_and_host $cur_location $git_branch_color$git_branch$prompt_tail$last_color "
}
color_prompt

cowfortune | lolcat
