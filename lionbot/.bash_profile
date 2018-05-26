# .bash_profile
NLP_PORT=10100

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin

export PATH

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# pyenv path
 export PATH="$HOME/.pyenv/bin:$PATH"
 eval "$(pyenv init -)"
 eval "$(pyenv virtualenv-init -)"

alias nginxoff="sudo fuser -k 80/tcp"
alias nginxon="sudo /opt/nginx/sbin/nginx"
alias nginxrestart="nginxoff && nginxon"

source $HOME/aliases.sh
