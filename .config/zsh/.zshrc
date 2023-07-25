# Starship prompt
eval "$(starship init zsh)"

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

# Synax fast highlighting
source ~/.config/zsh/plugins/fsh/fast-syntax-highlighting.plugin.zsh

# zsh-autosuggestions
source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# zvm | vim mode baby
source ~/.config/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# zsh-completions
fpath=(~/.config/zsh/plugins/zsh-completions/src $fpath)

# fuzzy finder
source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh

# Better cd
eval "$(zoxide init zsh)"

# The fuck
eval $(thefuck --alias)

# You can use whatever you want as an alias
eval $(thefuck --alias FUCK)

# Alias
alias ls='lsd'
alias vim='nvim'
alias py='python3'
alias ls='lsd -a'
