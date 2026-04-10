# Setting PATH for Python 3.11
# The original version is saved in .zprofile.pysave
# export PATH="$PATH:/Library/Frameworks/Python.framework/Versions/3.11/bin"

export PATH=/usr/local/bin:$PATH
export PATH=/Applications/Xcode.app/Contents/Developer/usr/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH

# Android dev env setup
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$ANDROID_HOME/emulator:$PATH
export PATH=$ANDROID_HOME/tools:$PATH
export PATH=$ANDROID_HOME/tools/bin:$PATH
export PATH=$ANDROID_HOME/platform-tools:$PATH

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
# export JAVA_HOME=$HOME/.asdf/installs/java/microsoft-17.35.1

# Root Certs
export NODE_EXTRA_CA_CERTS=$HOME/netskope-root-ca.pem
export SSL_CERT_FILE=$HOME/all-cas.pem
export REQUESTS_CA_BUNDLE=$HOME/all-cas.pem
export AWS_CA_BUNDLE=$HOME/all-cas.pem
