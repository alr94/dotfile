# vi mode
bindkey -v

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/areynold/.oh-my-zsh"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="my_agnoster"
source /usr/lib/nerd-fonts-complete/i_all.sh

ZSH_THEME="powerlevel10k/powerlevel10k"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context virtualenv dir rbenv vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs time command_execution_time)

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=3

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git vi-mode fast-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

export EDITOR=vim

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


################################################################################
# Manjaro setups

# # ex - archive extractor
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

export YAOURT_COLORS="nb=1:pkg=1:ver=1;32:lver=1;45:installed=1;42:grp=1;34:od=1;41;5:votes=1;44:dsc=0:other=1;35"

alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias np='nano -w PKGBUILD'
alias more=less

xhost +local:root > /dev/null 2>&1

################################################################################ 
# My Aliases etc...

# ZMV
autoload -U zmv

# alias for ranger in urxvt
alias rngr=urxvt -e ranger

# ls etc
alias ll='ls -lhF'
alias ltr='ls -lhtr'
alias la='ls -A'
alias l='ls -CF'

alias c='clear'
alias cl='clear;l'
alias cla='clear;la'
alias cll='clear;ll'
alias cltr='clear;ltr'


# swap files
function swap() {
  local TMPFILE=tmp.$$
  mv "$1" $TMPFILE
  mv "$2" "$1"
  mv $TMPFILE "$2"
}

# Kerberos config
export KRB5_CONFIG=$HOME/krb5.conf
alias klist='klist -A'

# SSH commands
function np() { ssh -Y np04-srv-0"$1" }
function npdaq() { ssh -Y np04daq@np04-srv-0"$1" }
function lxp() { ssh -Y lxplus"$1".cern.ch }
function dg() { ssh -Y dunegpvm"$1".fnal.gov }

alias pp8='ssh -Y reynoldsa@pplxint8.physics.ox.ac.uk'
alias pp9='ssh -Y reynoldsa@pplxint9.physics.ox.ac.uk'

alias lxb='ssh dune-vm-build-03'

alias db1='ssh dunebuild01.fnal.gov'

# Latex compiler
alias mylatex='pdflatex -synctex=1 -interaction=nonstopmode main.tex; bibtex main.aux; pdflatex -synctex=1 -interaction=nonstopmode main.tex; pdflatex -synctex=1 -interaction=nonstopmode main.tex'
alias thesislatex='pdflatex -interaction=nonstopmode Oxford_Thesis.tex; biber Oxford_Thesis; pdflatex -interaction=nonstopmode Oxford_Thesis.tex; pdflatex -interaction=nonstopmode Oxford_Thesis.tex'
alias outlinelatex='pdflatex -interaction=nonstopmode outline.tex; biber outline; pdflatex -interaction=nonstopmode outline.tex; pdflatex -interaction=nonstopmode outline.tex'

# ROOT
source ~/myroot/build/bin/thisroot.sh
alias root='root -l'

# networking
host='192.168.1.*'
alias macaddress="sudo nmap -sP \'${host}\' | grep MAC"

# Misc
alias graphics='sudo mhwd -f -i pci video-hybrid-intel-nvidia-390xx-bumblebee'
alias imshow='magick display'
alias display='xrandr --output DP3-2 --mode 2560x1440 --rate 74.94'

neofetch

# VNC
alias vnctunnel='ssh -K -L 5999:localhost:5999 -N -f -l areynold dunegpvm04.fnal.gov'
