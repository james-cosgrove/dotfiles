# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# NVM
export NVM_DIR="$HOME/.nvm"
  . "$HOME/.nvm/nvm.sh"

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

# Path to your oh-my-zsh installation.
export ZSH=/Users/jamescosgrove/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git, zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# Make fzf use Ripgrep
export FZF_DEFAULT_COMMAND='rg --files --follow'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

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
#
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

alias branch-name="git rev-parse --abbrev-ref HEAD"
alias ss="git status -s"                                                                    # Display shorthand git status
alias s="branch && git status -s"                                                  					# Display shorthand git status with amaing lolcat
alias master="git checkout master"                                                          # Checkout master branch
alias staging="git checkout staging"                                                        # Checkout staging branch
alias dev="git checkout development"                                                        # Checkout development branch
alias checkout="git checkout "                                                              # Checkout Branch
alias merge="git merge"                                                                 		# Merge Branch
alias pp=ppFunction																																     			# Pull merge then push
alias ppm=ppmFunction																																     		# Pull merge then push
alias push=pushCurrentBranch	                                                              # Push current branch
alias pull=pullCurrentBranch		                                                            # Pull current branch
alias branches="git branch | cowsay -f tux"                                                 # List Branches
alias branch=printCurrentBranch                                                      				# Current Branch
alias b=printCurrentBranch                                                                  # Current Branch
alias commit="git commit -m"                                                                # Shorthand for commiting
alias gadd="git add -A .; e_success 'Files added to be committed'"                          # Stage files
alias gacm="git add -A .; e_success 'Files added to be committed'; git commit -m"           # Stage files then commit them with message
alias reset='bundle exec rake db:migrate:reset && bundle exec rake seed:migrate'
alias s='rails s -b 0.0.0.0 -p 3000'
alias timesheet="git log --pretty='%C(bold blue)<%an>%Creset %Cgreen(%ad) %Cred%h%Creset -%C(auto)%d%Creset %s' --date=format:'%a %d-%m-%Y %H:%M:%S' --author=james"
alias glog="git log --pretty='%C(bold blue)<%an>%Creset %Cgreen(%ad) %Cred%h%Creset -%C(auto)%d%Creset %s' --date=format:'%a %d-%m-%Y %H:%M:%S'"
alias glol="git log --oneline"
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

# chruby config
source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh

BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
export PATH="/usr/local/opt/node@8/bin:$PATH"
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
export PATH="/usr/local/opt/libiconv/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
