# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Supports a bin directory inside home directory
export PATH=${HOME}/bin:${PATH}
# set path variables:
export PATH="$HOME/.local/bin:$HOME/.cabal/bin:$HOME/.ghcup/bin:$HOME/scripts:$PATH"
# to connect to the cardano-testnet:
# export CARDANO_NODE_SOCKET_PATH="/home/pekka/cardano/db/node.socket"
# to connect to the cardano mainnet:
export CARDANO_NODE_SOCKET_PATH="/home/pekka/cardano/db_main/node.socket"

# Export nvm completion settings for lukechilds/zsh-nvm plugin
# Note: This must be exported before the plugin is bundled
export NVM_DIR=${HOME}/.nvm
export NVM_COMPLETION=true

source ${HOME}/.zsh_plugins.sh

# Bundle zsh plugins via antibody
alias update-antibody='antibody bundle < $HOME/.zsh_plugins.txt > $HOME/.zsh_plugins.sh'
# Colored 'ls' MacOS
alias ls='ls -al'
alias ..='cd ..'
# Homebrew alias for daily management (MacOS)
alias brewup='brew update; brew upgrade; brew cleanup; brew doctor'
# List out all globally installed npm packages
alias list-npm-globals='npm list -g --depth=0'
# Adds better handling for `rm` using trash-cli
# https://github.com/sindresorhus/trash-cli
# You can empty the trash using the empty-trash command
# https://github.com/sindresorhus/empty-trash-cli
alias rm='trash'
# use neovim instead of vim
#alias vim='nvim'
# checkout branch using fzf
alias gcob='git branch | fzf | xargs git checkout'
# open vim config from anywhere
alias vimrc='vim ${HOME}/.config/nvim/init.vim'
# cat -> bat
alias cat='bat'
# shortcut to Tangram browser
alias surf='flatpak run re.sonny.Tangram &'
# shortcuts to config files
alias xmobarrc='vim ~/.config/xmobar/xmobarrc && source ~/.config/xmobar/xmobarrc'
alias xmonadrc='vim ~/.xmonad/xmonad.hs' 


# enable keybindings for Bash:
source /usr/share/doc/fzf/examples/key-bindings.zsh
# enable auto-completion for Bash:
source /usr/share/doc/fzf/examples/completion.zsh

# Load zsh-syntax-highlighting; should be last.
source ~/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null


# DIRCOLORS (MacOS)
export CLICOLOR=1
export LSCOLORS=FxFhcxdxbxegedabagacad

# FZF
export FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git'"
export FZF_DEFAULT_OPTS="--height=40% --layout=reverse --border --margin=1 --padding=1"

# <C-f> to search most common projects (personal, work) and 
# open selected in a tmux session. source: The Primeagen
bindkey -s ^p "tmux-sessionizer\n"

# PATH
# export PATH=${PATH}:/usr/local/go/bin
# export PATH=${PATH}:${HOME}/go/bin

# direnv package
# https://direnv.net/
# installed via homebrew
# used because of flexshopper/payment-plugin-3
# https://flexshopper.atlassian.net/wiki/spaces/DEV/pages/1377697814/Getting+Started+pp3
eval "$(direnv hook zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export BAT_THEME="gruvbox-dark"

# cd to directory then ls
cdd() { builtin cd "$@" && ls; }

# nix
if [ -e ~/.nix-profile/etc/profile.d/nix.sh ]; then . ~/.nix-profile/etc/profile.d/nix.sh; fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
