# .zshrc
autoload -U promptinit; promptinit
prompt pure

# Stop ly display beep
unsetopt beep


# History in cache directory:
HISTFILE=~/.histfile
HISTSIZE=9000000
SAVEHIST=9000000


# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)


# Synax fast highlighting
source ~/path/to/fsh/fast-syntax-highlighting.plugin.zsh


# zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh


# zvm | vim mode baby
source $HOME/.zsh-vi-mode/zsh-vi-mode.plugin.zsh


# zsh-completions
fpath=($HOME/Downloads/git/zsh-completions/src $fpath)

# fuzzy finder
source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh


# Alias
alias ls='lsd'
alias vim='nvim'
alias reboot= 'sudo reboot'
