# git
alias gst="git status"
alias gbrc="git branch"
alias glg="git log --all --decorate --oneline --graph"
alias ipy="python3 manage.py shell"

# file search
sfind(){
    find . -name "*.${2-py}" | xargs grep -nr "$1"
    echo =====================================
    echo found \'$1\' in ${2-py} files
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

# cpp compile
cmpl(){
    rm app.out
    g++ -std=c++11 -Wall -ggdb -o "app.out" "$1"
    ./app.out
}

# ssh
alias gw="ssh {GATEWAY_HOST}"

# directory
function up( )
{
    LIMIT=$1
    P=$PWD
    for ((i=1; i <= LIMIT; i++))
    do
        P=$P/..
    done
    cd $P
    export MPWD=$P
}
function back( )
{
    LIMIT=$1
    P=$MPWD
    for ((i=1; i <= LIMIT; i++))
    do
        P=${P%/..}
    done
    cd $P
    export MPWD=$P
}
