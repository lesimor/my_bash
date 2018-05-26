## CUSTOM ALIAS
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

## ETC
alias src='source ~/.bash_profile'

## GIT
# Git essentials
alias gst='git status'
alias glg="git log --all --decorate --oneline --graph"
alias gb='git branch'
alias gbv='git branch -v'

# git checkout <branch>
function gco()
{
    echo Trying checkout ${1-master} branch 
    git checkout ${1-master}
}

# git add <files> 
function ga()
{
    if [ -z "$1" ]; then
        echo "######################"
        echo "No files selected"
        echo "######################"
    else
        git add "$@"
    fi
}

# git commit -m <commit message> 
function gcm()
{
    if [ -z "$1" ]; then
        echo "######################"
        echo Commit message required
        echo "######################"
    else
        git commit -m "$1"
    fi
}

# git branch sync with remote 
# checkout and pull
function gbs()
{
    git checkout ${1-master}
    git pull ${2-origin} master
} 

# push
function gp()
{
    git push -u ${1-origin} $(git rev-parse --abbrev-ref HEAD)
} 

alias f='git add --all :/; git commit -m "fix"'
alias fp='git add --all :/; git commit -m "fix"; git push'
alias wip='git add --all :/; git commit -am "wip"'

alias l='git pull --rebase'

alias gsh='git show'

alias aa='git add --all :/'
alias ap='git add --patch'
alias co='git commit'
alias com='git commit -m'
alias ca='git add --all :/; git commit --amend --no-edit'

alias p='git push'
alias pp='git push -u origin $(git rev-parse --abbrev-ref HEAD)'

alias st='git stash'
alias sp='git stash pop'

alias uns='git reset HEAD'
alias unc='git reset --soft HEAD\^'

alias gl='git log --graph --date=short --pretty=oneline --abbrev-commit'
alias gls='git log --graph --date=short --pretty=oneline --abbrev-commit -n10'

alias gri='git rebase -i'
alias grc='git rebase --continue'
alias rim='git rebase -i master'
alias rid='git rebase -i develop'

alias gclone='git clone'
alias ginit='git init'

# Other git aliases
alias gcb='git rev-parse --abbrev-ref HEAD' #current branch
alias gdd='git diff develop'
alias gdm='git diff master'
alias gi='vim .gitignore'
alias gm='git merge --no-ff'
alias gmd='git merge --no-ff develop'
alias gmm='git merge --no-ff master'
alias gms='git merge --squash'
alias grv='git remote -v'
alias grr='git remote rm'
alias grad='git remote add'
alias gr='git rebase'
alias gra='git rebase --abort'
alias gf='git fetch'
alias gdc='git diff --cached -w'
alias gpl='git pull'
alias grs='git reset'
alias grsh='git reset --hard'
alias gcln='git clean'
alias gclndf='git clean -df'
alias gclndfx='git clean -dfx'
alias gcp='git cherry-pick'
alias gcpc='git cherry-pick --continue'
alias gcpa='git cherry-pick --abort'

