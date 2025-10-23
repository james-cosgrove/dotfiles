# Setting PATH for Python 3.11
# The original version is saved in .zprofile.pysave
# export PATH="$PATH:/Library/Frameworks/Python.framework/Versions/3.11/bin"

export PATH=/usr/local/bin:$PATH
export PATH=/Applications/Xcode.app/Contents/Developer/usr/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH

# Homebrew
# For non-standard Homebrew installation as required due to no root access
# Also set HOMEBREW_DIR variable for handling non-standard installation
export HOMEBREW_DIR
export HOMEBREW_CASK_OPTS="--appdir=~/Applications"

if [ -d "${HOME}/homebrew" ] 2>/dev/null; then
	export PATH=$HOME/homebrew/bin:$PATH
  HOMEBREW_DIR="$HOME/homebrew"
else
  HOMEBREW_DIR="/usr/local"
fi

# NVM
# If NVM is installed on machine - suppress error reporting in command line
export NVM_LAZY_LOAD=true
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
export PATH=$ANDROID_HOME/emulator:$PATH
export PATH=$ANDROID_HOME/tools:$PATH
export PATH=$ANDROID_HOME/tools/bin:$PATH
export PATH=$ANDROID_HOME/platform-tools:$PATH

# Python and pyenv
export PATH=$HOME/Library/Python/3.9/bin:$PATH
export PATH=$HOME/Library/Python/3.10.13/bin:$PATH
export PATH=$HOME/Library/Python/3.11/bin:$PATH
alias python=/usr/bin/python3
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
export PATH="$(pyenv root)/shims:${PATH}"

# Perl for neovim
PATH=${HOME}/perl5/bin${PATH:+:${PATH}}; export PATH;
PERL5LIB="${HOME}/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="${HOME}/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"${HOME}/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=${HOME}/perl5"; export PERL_MM_OPT;

export PATH="$HOME/homebrew/opt/curl/bin:$PATH"
export PATH="$HOME/homebrew/opt/llvm/bin:$PATH"

export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
export PUPPETEER_EXECUTABLE_PATH=`which chromium`

# Java setup
export JAVA_HOME=$HOME/Library/Java/JavaVirtualMachines/azul-17.0.11/Contents/Home

# Ruby
export PATH="$HOME/.rbenv/bin:$PATH"
type rbenv &>/dev/null && eval "$(rbenv init -)"

# Node
eval "$(nodenv init -)"
export NODE_BINARY=/usr/local/bin/node

# Root Certs
export NODE_EXTRA_CA_CERTS=$HOME/netskope-root-ca.pem
export SSL_CERT_FILE=$HOME/all-cas.pem
export REQUESTS_CA_BUNDLE=$HOME/all-cas.pem
export AWS_CA_BUNDLE=$HOME/all-cas.pem

# ASDF
asdf() {
  . ~/.asdf/plugins/java/set-java-home.zsh
  . ${HOMEBREW_DIR}/opt/asdf/libexec/asdf.sh
}

