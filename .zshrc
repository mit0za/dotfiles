# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Auto complete 
# source [location of zsh-autocomplete.plugin.zsh]
source ~/Downloads/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# Stop beep sounds
unsetopt beep

# History in cache directory:
HISTFILE=~/.histfile
HISTSIZE=9000000
SAVEHIST=9000000

#Enable colors 
#autoload -U colors && colors
#PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist

# vi mode
bindkey -v 
export KEYTIMEOUT=1

# Syntax highlighting
# source [location of zsh-syntax-highlighting.zsh]
# Desktop
source /home/verhen/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Laptop
#source /home/mitoza/Downloads/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Auto suggestion
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Alias
alias ls='lsd'

# Apply antigen
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
