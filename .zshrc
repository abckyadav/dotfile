# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="cloud"

COMPLETION_WAITING_DOTS="true"

BASE16_SHELL_PATH="$HOME/.config/base16-shell"
[ -n "$PS1" ] && \
  [ -s "$BASE16_SHELL_PATH/profile_helper.sh" ] && \
    source "$BASE16_SHELL_PATH/profile_helper.sh"

plugins=(git aliases colorize command-not-found copypath emoji emoji-clock)

source $ZSH/oh-my-zsh.sh

# Download Znap, if it's not there yet.
[[ -f ~/Git/zsh-snap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/Git/zsh-snap

source ~/Git/zsh-snap/znap.zsh  # Start Znap

# `znap source` automatically downloads and starts your plugins.
znap source marlonrichert/zsh-autocomplete
znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-syntax-highlighting

# Aliases
alias connect-itda="sudo openfortivpn 103.116.26.4:10443 --username=Raj_kamal --password=R@jjK@11@145 --trusted-cert b1d6b7bd6c6dea236ada36b15236ca5bda2449b92a734da1f4e87b17979d664e"
alias apt-up="sudo apt-get update && stuod apt-get upgrade"
alias rm-db="sudo rm -rf db-data"
alias mv-db="mv ./unnati-db/db-data ."
alias dev="npm run dev"
alias start="npm run start:dev"
alias up="sudo docker compose up"

export NVM_DIR="$HOME/.config/nvm"
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

# Enable starship
eval "$(starship init zsh)"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

JAVA_HOME="/usr/java/jre1.8.0_371"

# pnpm
export PNPM_HOME="/home/abhishek/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
# sst
export PATH=/home/abhishek/.sst/bin:$PATH

# fly.io
export FLYCTL_INSTALL="/home/abhishek/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"
