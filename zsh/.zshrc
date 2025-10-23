# zmodload zsh/zprof

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

ZSH_DISABLE_COMPFIX=true

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
zstyle ':omz:plugins:nvm' lazy yes
plugins=(git zsh-autosuggestions nvm asdf)

source $ZSH/oh-my-zsh.sh

# Make fzf use Ripgrep
export FZF_DEFAULT_COMMAND='rg --files --follow'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

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

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# For a full list of active aliases, run `alias`.
#
# Headers and  Logging

e_header() { printf "\n${bold}${purple}==========  %s  ==========${reset}\n\n" "$@"
}
e_arrow() { printf "➜ $@\n"
}
e_success() { printf "\n${green}✔ %s${reset}\n\n" "$@"
}
e_error() { printf "${red}✖ %s${reset}\n" "$@"
}
e_warning() { printf "${tan}➜ %s${reset}\n" "$@"
}
e_underline() { printf "${underline}${bold}%s${reset}\n" "$@"
}
e_bold() { printf "${bold}%s${reset}\n" "$@"
}
e_note() { printf "${underline}${bold}${blue}Note:${reset}  ${blue}%s${reset}\n" "$@"
}

# Git util functions

pullCurrentBranch(){
	branch=$( branch-name )
	git pull origin $branch
	e_success "Commits pulled from \"$branch\""
}
pushCurrentBranch(){
	branch=$( branch-name )
	git push origin $branch
	e_success "Commits pushed to \"$branch\""
}
forcePushCurrentBranch(){
	branch=$( branch-name )
	git push --force-with-lease origin $branch
	e_success "Commits pushed to \"$branch\""
}
printCurrentBranch(){
	if [ -z "$1" ]; then
		branch=$( branch-name )
		e_header "Current branch is \"$branch\""
	else
		git branch $1
		git checkout $1
		e_success "Created new branch: \"$1\""
	fi
}

# Aliases

# Git
alias branch-name="git rev-parse --abbrev-ref HEAD"
alias gss="git status -s"                                                                    # Display shorthand git status
alias gs="branch && git status -s"                                                  					# Display shorthand git status with amaing lolcat
alias master="git checkout master"                                                          # Checkout master branch
alias staging="git checkout staging"                                                        # Checkout staging branch
alias dev="git checkout dev"                                                            # Checkout development branch
alias checkout="git checkout "                                                              # Checkout Branch
alias merge="git merge"                                                                 		# Merge Branch
alias push=pushCurrentBranch	                                                              # Push current branch
alias pull=pullCurrentBranch		                                                            # Pull current branch
alias forcepush=forcePushCurrentBranch	                                                              # Push current branch
alias branches="git branch | cowsay -f tux"                                                 # List Branches
alias branch=printCurrentBranch                                                      				# Current Branch
alias b=printCurrentBranch                                                                  # Current Branch
alias commit="git commit -m"                                                                # Shorthand for committing
alias gamend="git commit -a --amend --no-edit"                                              # Amend last commit by adding all local changes without message
alias gadd="git add -A .; e_success 'Files added to be committed'"                          # Stage files
alias gacm="git add -A .; e_success 'Files added to be committed'; git commit -m"           # Stage files then commit them with message
alias glog="git log --pretty='%C(bold blue)<%an>%Creset %Cgreen(%ad) %Cred%h%Creset -%C(auto)%d%Creset %s' --date=format:'%a %d-%m-%Y %H:%M:%S'"
alias glol="git log --oneline"
alias timesheet="git log --pretty='%C(bold blue)<%an>%Creset %Cgreen(%ad) %Cred%h%Creset -%C(auto)%d%Creset %s' --date=format:'%a %d-%m-%Y %H:%M:%S' --author=james"

# Utils
alias pythonstart="source venv/bin/activate && ./run.sh"
alias list-android="emulator -list-avds"
alias reverse="adb reverse tcp:8081 tcp:8081"
alias sleep="pmset sleepnow"

# saml2aws Aliases
alias samlmartechdev='saml2aws login --role=arn:aws:iam::031822892316:role/cloud-saml-martech-dev-developer --profile dev --disable-sessions --force --skip-prompt && export AWS_PROFILE=dev'
alias samlmartechstg='saml2aws login --role=arn:aws:iam::031822892316:role/cloud-saml-martech-stg-developer --profile stg --disable-sessions --force --session-duration=10800 --skip-prompt && export AWS_PROFILE=stg_dev'
alias samlmartechprd='saml2aws login --role=arn:aws:iam::031822892316:role/cloud-saml-martech-prd-developer --profile prd --disable-sessions --force --session-duration=3600 --skip-prompt && export AWS_PROFILE=prd'

# Misc
alias weather="curl wttr.in/Melbourne"

# Set Colors

#bold=$(tput bold)
#underline=$(tput sgr 0 1)
#reset=$(tput sgr0)
#purple=$(tput setaf 171)
#red=$(tput setaf 1)
#green=$(tput setaf 76)
#tan=$(tput setaf 3)
#blue=$(tput setaf 38)

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        source "$BASE16_SHELL/profile_helper.sh"

base16_classic-dark

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# zprof
