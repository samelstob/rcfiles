
# User specific aliases and functions
alias ....='cd .. && cd .. && cd ..'
alias ...='cd .. && cd ..'
alias ..='cd ..'
alias asyntax='asciidoc --help syntax'
alias ad="asciidoc -a toc"
alias arcticlocate="ssh arctic locate"
export b4_1=b20050727_rb_a
export b4_2=b20061012_rb_a
export b4_3=b20070626_yz_a
export b5_0=b20080916_ba_a
bp() {
 tag_file=$TAG_DESCRIPTIONS
 cvs_tag=`cat CVS/Tag`
 grep_out=`grep -n ${cvs_tag:1} $tag_file`
 lin_num=${grep_out%:*}
 lin_num1=$((lin_num+1))
 lin_num2=$((lin_num+2))
 if [ $1 = "diff" ]
 then
   p_tag=`sed -n $lin_num2'p' $tag_file`
   p_tag=`echo "$p_tag" | sed 's/Parent\ tag:\ *//'`
   r   
   cvs -q diff -r $p_tag > diff_to_${p_tag}_all.txt
   cp diff_to_${p_tag}_all.txt diff_to_${p_tag}_files.txt
   sed -i '/^[^I]/ d' diff_to_${p_tag}_files.txt  
 else
   echo ${cvs_tag:1} 
   sed -n $lin_num1'p' $tag_file
   sed -n $lin_num2'p' $tag_file  
 fi  
}

alias c="cvs"
alias cnup="cvsnup"
alias cup="cvsup"
alias cvs-my-commits='cvs log -N -r$CVS_BRANCH '
alias cvscd=". cvscd"
alias cvsnup="cvs -qn up"
alias cvsup="cvs up -Pd"
alias die_outlook_die="kill `ps -ef | grep -i outlook | grep -v grep | awk '{print $2}' | xargs`"
alias df="df -h"
alias dfind="find -type d -iname $@"
#Edit devlog for current branch 
dl() {
  r
  cvs_tag=`cat CVS/Tag`
  cvs_tag=${cvs_tag#T}
  dev_log_path=`find htrak/devlog/v5 -name $cvs_tag.txt`
  vi $dev_log_path
}
alias drakelocate="ssh drake locate"
alias ff=firefox
alias ffind="find -iname $@"
alias go="xdg-open"
alias iostat="sudo iostat -xm 5 /dev/sda /dev/sdb /dev/sdc"
alias kernelchanges="rpm -q --changelog $(rpm -q kernel|tail -n1)|less"
alias l="ls -lh"
alias ll="ls -lh"
alias maven2eclipsewtp="mvn -DdownloadJavadocs=true -DdownloadSources=true -Dwtpversion=1.5 eclipse:eclipse"
alias merclocate="ssh merc locate"
alias nlsdateformat="echo \"ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY/MM/DD HH24:MI:SS';\" | xclip"
alias openports='netstat -nape --inet'
alias fullpath='readlink -f '
alias p='ping www.google.com'
alias projectenv=". ~/project-env"
alias pwdin='cd $(xclip -o)'
alias pwdout='pwd|xclip'
# cd to root directory 
r() {
 curr_dir=`pwd`
 root_dir=${curr_dir%/htrak/*}
 cd $root_dir
}
alias rsynceasy='rsync --executability --perms --links --update --recursive --verbose --human-readable'
alias sqlplus="rlwrap sqlplus"
#alias sqlplus="sqlpython"
tc-log() {
    view $TOMCAT_HOME/logs/catalina.out
}
tc-start() {
    $TOMCAT_HOME/bin/tomcat.init.sh start
}
tc-stop() {
    $TOMCAT_HOME/bin/tomcat.init.sh stop
}
tc-tail() {
    tail -f $TOMCAT_HOME/logs/catalina.out
}
tc-conf() {
    vi $TOMCAT_HOME/conf/Catalina/localhost/hmshow.xml
}
alias v="vi"
alias vitd="pushd $HTRAKINFO && cvs -Q up -Pd && popd && vi $TAG_DESCRIPTIONS && pushd $(dirname $TAG_DESCRIPTIONS) && pwd && cvs commit -m "tags" $(basename $TAG_DESCRIPTIONS); popd"
alias vitd4="pushd $HTRAKINFO && cvs -Q up -Pd && popd && vi $HTRAKINFO/htrakinfo/release-docs/v4-tag-descriptions && pushd $HTRAKINFO && cvs commit; popd"
alias vimergelog="pushd $HTRAKINFO && cvs -Q up -Pd && popd && vi $HTRAKINFO/htrakinfo/release-docs/v6-merge-log && pushd $HTRAKINFO && cvs commit htrakinfo/release-docs/v6-merge-log; popd"
alias vitl="vi $TOMCAT_LOG"
alias webshare='python -c "import SimpleHTTPServer;SimpleHTTPServer.test()"'
alias wgetarchive='wget -E -H -k -K -p'

# Make cd use pushd internally.  Needs a little hack to emulate
# cd with no arguments.
function cd()
{
    if [[ $# > 0 ]]
    then
        pushd "$@" > /dev/null
    else
        pushd $HOME > /dev/null
    fi
}

function cvsdiff() { cvs diff $@ | colordiff | less -R; }
function svndiff() { svn diff $@ | colordiff | less -R; }

function dbsuffix()
{
    if [[ $# == 0 ]]
    then
        export DBSUFFIX=""
    else
        export DBSUFFIX=$1
    fi
    echo "DBSUFFIX $DBSUFFIX"
}

function dbo()
{
    dbsuffix orafeed
}

function dbg()
{
    dbsuffix gui
}

function grep-release-notes()
{
    pushd $HTRAKINFO/htrakinfo/release-docs/v5_release-notes && cvs -Q up -Pd && ./grep-release-notes.sh "$@" ;popd
}

function updatedblogin()
{
    . ~/bin/set-branch-sqlplus-login.env $DBSUFFIX
}

function sql()
{
    updatedblogin
    sqlplus $DBLOGIN $@
}

function syssql()
{
    #updatedblogin
    #sqlplus $DBSYSTEMLOGIN $@
    sqlplus dev/triangle@baltic $@
}

sqo()
{
 curr_dir=`pwd`
 root_dir=${curr_dir%/htrak/*}
 schema=`egrep -r '^ORAFEED_SCHEMA_NAME=' $root_dir/htrak/conf/trio.conf | cut -d'=' -f2`
 sqlplus $schema/x
}
sqg()
{
 curr_dir=`pwd`
 root_dir=${curr_dir%/htrak/*}
 schema=`egrep -r '^GUI_SCHEMA_NAME=' $root_dir/conf/trio.conf | cut -d'=' -f2`
 tnsname=`egrep -r '^DATABASE_TNS_NAME=' $root_dir/conf/trio.conf | cut -d'=' -f2`
 sqlplus $schema/x@$tnsname
}


function cdf()
{
    found_dir=$(find -type d -iname $@)
    if [[ -n $found_dir ]]
    then
        pushd $found_dir
    else
        echo "Couldn't find directory: $@"
    fi 
}

function vif()
{
    vi $(find -name $@)
}

function cvsci()
{
    cvsdiff $@ && cvs ci $@
}

function svnci()
{
    pre-commit-check.pl $@ && svndiff $@ && svn ci $@
}

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

function ls_as_urls()
(
    # Display the given file paths as URLs to the file server
    #
    # e.g.
    #
    # ls_as_urls /vol/general/development/tracefiles
    #
    # Output:
    #       http://drake/general/development/excluded_from_backup/tracefiles
    #
    # Currently hardcoded for drake
    #
    FILE_SERVER_URL="http://drake/"
    for file
    do
        # Convert all symlinks to full paths
        fullpath=$(readlink -f $file)
        echo ${fullpath/"/vol/"/$FILE_SERVER_URL}
    done
)
