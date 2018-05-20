# define colors
C_DEFAULT="\[\033[m\]"
C_WHITE="\[\033[1m\]"
C_BLACK="\[\033[30m\]"
C_RED="\[\033[31m\]"
C_GREEN="\[\033[32m\]"
C_YELLOW="\[\033[33m\]"
C_BLUE="\[\033[34m\]"
C_PURPLE="\[\033[35m\]"
C_CYAN="\[\033[36m\]"
C_LIGHTGRAY="\[\033[37m\]"
C_DARKGRAY="\[\033[1;30m\]"
C_LIGHTRED="\[\033[1;31m\]"
C_LIGHTGREEN="\[\033[1;32m\]"
C_LIGHTYELLOW="\[\033[1;33m\]"
C_LIGHTBLUE="\[\033[1;34m\]"
C_LIGHTPURPLE="\[\033[1;35m\]"
C_LIGHTCYAN="\[\033[1;36m\]"
C_BG_BLACK="\[\033[40m\]"
C_BG_RED="\[\033[41m\]"
C_BG_GREEN="\[\033[42m\]"
C_BG_YELLOW="\[\033[43m\]"
C_BG_BLUE="\[\033[44m\]"
C_BG_PURPLE="\[\033[45m\]"
C_BG_CYAN="\[\033[46m\]"
C_BG_LIGHTGRAY="\[\033[47m\]"

# GIT
parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
parse_home() {
    echo $HOME | sed -e 's/.*\/\(.*\)/\1)/'
}

export PS1="$C_BG_RED\$(parse_home)$C_BG_BLUE\h $C_DEFAULT \W$C_LIGHTYELLOW\$(parse_git_branch)$C_DEFAULT $ "
# \u : 유저명
# \h : 호스트명
# \W : 작업 디렉토리

alias gst="git status"
alias gbrc="git branch"
alias glg="git log --all --decorate --oneline --graph"

# file search
sfind(){
    if [ -z "$2" ]
    then
        find . -name . | xargs grep -nr "$1"
        echo found \'$1\' in all files
    else
        find . -name "*.${2-py}" | xargs grep -nr "$1"
        echo =====================================
        echo found \'$1\' in ${2-py} files
    fi
}

# file name search
nfind(){
    find . -name "*$1*.${2-py}" -print
    echo =====================================
    echo name with \'$1\' in ${2-py} files
}

# clean swap file
csf(){
    find . -type f -name "*.sw[klmnop]" -delete
}

# process info
psp()
{
    PORT=$1
    if [ -z "$PORT" ]
    then
        echo you should set port with second param
    else
        lsof -n -i :$PORT | grep LISTEN
        echo =================================
        echo processes with LISTEN state on port $PORT
    fi
}
