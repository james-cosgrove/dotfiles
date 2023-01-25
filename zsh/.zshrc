# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

ZSH_DISABLE_COMPFIX=true

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

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
plugins=(git zsh-autosuggestions)

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
alias ss="git status -s"                                                                    # Display shorthand git status
alias s="branch && git status -s"                                                  					# Display shorthand git status with amaing lolcat
alias master="git checkout master"                                                          # Checkout master branch
alias staging="git checkout staging"                                                        # Checkout staging branch
alias dev="git checkout develop"                                                            # Checkout development branch
alias checkout="git checkout "                                                              # Checkout Branch
alias merge="git merge"                                                                 		# Merge Branch
alias pp=ppFunction																																     			# Pull merge then push
alias ppm=ppmFunction																																     		# Pull merge then push
alias push=pushCurrentBranch	                                                              # Push current branch
alias pull=pullCurrentBranch		                                                            # Pull current branch
alias forcepush=forcePushCurrentBranch	                                                              # Push current branch
alias branches="git branch | cowsay -f tux"                                                 # List Branches
alias branch=printCurrentBranch                                                      				# Current Branch
alias b=printCurrentBranch                                                                  # Current Branch
alias commit="git commit -m"                                                                # Shorthand for commiting
alias amend="git commit -a --amend --no-edit"                                              # Amend last commit by adding all local changes without message
alias gadd="git add -A .; e_success 'Files added to be committed'"                          # Stage files
alias gacm="git add -A .; e_success 'Files added to be committed'; git commit -m"           # Stage files then commit them with message
alias glog="git log --pretty='%C(bold blue)<%an>%Creset %Cgreen(%ad) %Cred%h%Creset -%C(auto)%d%Creset %s' --date=format:'%a %d-%m-%Y %H:%M:%S'"
alias glol="git log --oneline"
alias timesheet="git log --pretty='%C(bold blue)<%an>%Creset %Cgreen(%ad) %Cred%h%Creset -%C(auto)%d%Creset %s' --date=format:'%a %d-%m-%Y %H:%M:%S' --author=james"

# Utils
alias pythonstart="source venv/bin/activate && ./run.sh"
alias reset='bundle exec rake db:migrate:reset && bundle exec rake seed:migrate'
alias s='rails s -b 0.0.0.0 -p 3000'
alias list-android="emulator -list-avds"
alias reverse="adb reverse tcp:8081 tcp:8081"
alias sleep="pmset sleepnow"

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

export PATH="$HOME/Library/Python/3.9/bin:$PATH"
export PATH="/Applications/Xcode.app/Contents/Developer/usr/bin:$PATH"
export PATH=/usr/local/bin:$PATH

# chruby config
# Add conditional to check if directory exists for machines that don't run ruby
if [ -d /usr/local/opt/chruby/share/chruby/chruby.sh ]; then
  source /usr/local/opt/chruby/share/chruby/chruby.sh
  source /usr/local/opt/chruby/share/chruby/auto.sh
fi

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        source "$BASE16_SHELL/profile_helper.sh"

base16_classic-dark

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export HOMEBREW_DIR

# For non-standard Homebrew installation as required due to no root access
# Also set HOMEBREW_DIR variable for handling non-standard installation
if [ -d "${HOME}/homebrew" ] 2>/dev/null; then
	export PATH=$HOME/homebrew/bin:$PATH
  HOMEBREW_DIR="$HOME/homebrew"
else
  HOMEBREW_DIR="/usr/local"
fi

export PATH=$HOMEBREW_DIR:$PATH

# NVM - only if NVM is installed on machine - supress error reporting in command line
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

autoload -U add-zsh-hook
load-nvmrc() {
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
      nvm use
    fi
  elif [ -n "$(PWD=$OLDPWD nvm_find_nvmrc)" ] && [ "$(nvm version)" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# Android dev env setup
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

alias python=/usr/bin/python3
export PYENV_ROOT="$HOME/.pyenv"
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

if [ -d "${HOME}/homebrew/opt/ruby/bin" ]; then
  export PATH=$HOME/homebrew/opt/ruby/bin:$PATH
  export PATH=`gem environment gemdir`/bin:$PATH
fi

PATH="${HOME}/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="${HOME}/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="${HOME}/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"${HOME}/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=${HOME}/perl5"; export PERL_MM_OPT;

eval "$(nodenv init -)"

export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
export PUPPETEER_EXECUTABLE_PATH=`which chromium`
