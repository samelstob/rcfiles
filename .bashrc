# .bashrc
shopt -s cdspell
export HISTFILESIZE=10000 # the bash history should save this many commands
export HISTCONTROL=ignoredups #don't put duplicate lines in the history.
# For bash debugging
export PS4='$(basename $BASH_SOURCE) +${LINENO} ${FUNCNAME:-} (${SHLVL},${BASH_SUBSHELL}, \$?=$?): '

[ -f /usr/local/lib/qprof/alias.sh ] && . /usr/local/lib/qprof/alias.sh

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi


export EDITOR=`which --skip-alias vim`
export ECLIPSE_HOME=~/eclipse/
export SQLPATH=~/sql_scripts/
export CVS_RSH=ssh
if [ -z $CVSROOT ]
then
        export CVSROOT=:ext:sam@cvs:/vol/cvsroot
fi
export TOMCAT_HOME=~/tomcat
export TOMCAT_LOG=$TOMCAT_HOME/logs/catalina.out
export CVS_MY_INITIALS="se"
export HTRAKINFO="$HOME/htrakinfo/"
export TAG_DESCRIPTIONS="$HTRAKINFO/htrakinfo/release-docs/v6-tag-descriptions"
export RELEASE_DOCS=$HTRAKINFO/htrakinfo/release-docs/
# Java 1.6 requires this
export LIBXCB_ALLOW_SLOPPY_LOCK=1

export PATH=$PATH:/usr/local/sbin:/usr/sbin:/sbin
export drake_vol=/vol/
if [[ $HOSTNAME == mercedes ]]
then
    alias gdb="/usr/local/gcc4_1/bin/gdb"
    export PATH=/usr/local/vim7/bin:$PATH
elif [[ $HOSTNAME = deben ]]
then
        export drake_vol=/vol
        export ICONS=/mnt/drake/general/development/third_party/icons/crystal_project
        #TERM=xterm-256color
elif [[ $HOSTNAME = arctic.office.triometric.net ]]
then
    export M2_HOME=$HOME/local/maven2/
    export M2=$M2_HOME/bin
    export MAVEN_OPTS="-Xms256m -Xmx512m"
    export M2_REPO=$HOME/.m2/repository/
    PATH=$M2:$PATH
fi

export general=$drake_vol/general/
export software=$drake_vol/software

export RELEASE_DIR=$general/development/releases/
export TRACE_DIR=$general/development/tracefiles/
export ICONS=$general/development/third_party/icons/crystal_project
export HTRAK_LICENSE=$general/development/testing/license
export thirdparty=$general/development/third_party/documentation/
export SVN_REPO=file:////home/sam/svn/repos/sam/
export GRAILS_HOME=$HOME/grails
PATH=$GRAILS_HOME/bin:$PATH
export HOLS=$HOME/doc/manage/holidays

#[ $HOSTNAME = deben ] && export TRACE_DIR=$HOME/excluded_from_backup/tracefiles

set -o noclobber

. $HOME/.bash_aliases
#PS1='[\u@\h \W]\$ '
# Ruby 1.9
if [[ -s "$HOME/.rvm/scripts/rvm" ]] ; then source "$HOME/.rvm/scripts/rvm" ; fi
export PATH=$HOME/local/bin:$PATH
