# $Id: bash_profile,v 1.3 2010/07/18 21:59:26 rml Exp $
# - prototype .rc for Borne shell and its derivatives
[ -r .acms.debug ] && echo ENTERED .bash_profile >&2
public=${public:-/public}

# All the usual setup is done by the following line.  Any additions
# you make should come after it.
#
[ -r $public/bash_profile.adjunct ] && . $public/bash_profile.adjunct

# When this file was first placed in your home directory, a
# pre-existing bashrc file may have been moved to a file named
# "${HOME}/.bashrc.old". Check the commands in that file be
# sure they are still needed.


# You may add commands to the end of this file as needed.
#
# CAUTION: if you choose to make adjustments to PATH,
# it is usually advisable to *add* to the existing PATH
# rather than resetting PATH completely.  By adding, there
# is less chance of inadvertently losing important elements.
# For example:  set path = ( $path ${HOME}/bin )
[ -r .acms.debug ] && echo EXITED .bash_profile >&2
# PS1='\[\e[0;36m\][\u@\h]:\W:\!\$\[\e[0m\] '
#export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:${HOME}/lib"
export PATH="$PATH:${HOME}/local/bin"
PS1='\[\e[0;36m\][\u@\h]:\W\$\[\e[0m\] '
alias ref="~/ref.sh"
alias gc="git commit"
alias ls="ls --color"
alias cc80="grep -I '.\{80,\}' *"
alias todo="grep TODO *"

exit() {
  if [[ -z $TMUX ]]; then
    builtin exit
  else
    tmux detach
  fi
}

tmux attach
