[ -f /etc/bashrc ] && . /etc/bashrc
[ -f /etc/bash_completion ] && . /etc/bash_completion

export HISTSIZE=1000000
export HISTCONTROL=ignoredups # don't put duplicate lines in the history
export HISTCONTROL=ignoreboth # ... and ignore same sucessive entries.

shopt -s checkwinsize # update LINES and COLUMNS based on window size
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)" #less on binary files, e.g. tars

#rxvt-unicode and rxvt-256color => rxvt {for legacy}
case "$TERM" in rxvt*) TERM=rxvt ;; esac

prependPath() {
  case $PATH in
    $@:* | *:$@ | *:$@:* ) ;;
    *) export PATH=$@:$PATH
  esac
}
prependPath $HOME/bin
prependPath $HOME/.cabal/bin

#command prompt
if [ "$DISPLAY" == "" ]; then
  #host abbrevs
  case `hostname -s` in
    "wolke-w520"              ) h='@w520' ;;
    "wolk-desktop"            ) h='@desk' ;;
    "wolke-n900"              ) h='@n900' ;;
    "Benjamins-MacBook-Pro"   ) h='@bensmac' ;;
    *                         ) h='@\h' ;;
  esac
else
  #if display is set, you probably know where you are
  h=""
fi
if [ "$USER" == "BenjaminAguayza" ]; then
  u=ben
else
  u="\u"
fi
c1='\[\033[01;32m\]'
c2='\[\033[01;34m\]'
cEnd='\[\033[00m\]'
PS1="$c1$u$h$cEnd:$c2\w$cEnd\$ "


#window title => $WINDOW_TITLE or "Terminal: pwd"
CMD1='echo -ne "\033]0;$WINDOW_TITLE\007"'
CMD2='echo -ne "\033]0;Terminal: ${PWD/$HOME/~}\007"'
PROMPT_COMMAND="if [ -n \"\$WINDOW_TITLE\" ]; then $CMD1; else $CMD2; fi"

alias shut='sudo poweroff'
alias shutdown='poweroff'
alias susp='sudo pm-suspend'
alias suspend='pm-suspend'
alias rest='sudo reboot'
alias restart='reboot'
alias cx='chmod +x'
alias :q='exit'
alias suod='sudo'
alias sudp='sudo'
alias wconnect='sudo wconnect'
alias resolv='sudo resolvchooser'
alias exot='exit'
alias exut='exit'
alias l='ls -al --color=auto'
alias ll='ls -al --color=auto'
alias ld='ls -dal --color=auto'
alias mplayer='WINDOW_TITLE=MPLAYER; mplayer'
alias migl='miglatest'

