# $HOME/dotfiles/zsh/.zshrc

# Load aliases
source "$XDG_CONFIG_HOME/zsh/aliases"

# vi-mapping for autoselect menus
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# Initialize autocompletion of shell commands
autoload -U compinit; compinit

# Autocomplete hidden files
_comp_options+=(globdots)
source "$HOME/dotfiles/zsh/external/completion.zsh"

# Path to external file directory to autoload at startup
fpath=($ZDOTDIR/external $fpath)

# Load custom prompt file
autoload -Uz prompt_purification_setup; prompt_purification_setup

# Push the current directory visited onto the stack.
setopt AUTO_PUSHD

# Do not store duplicate directories in the stack.
setopt PUSHD_IGNORE_DUPS

# Do not print the directory stack after using pushd or popd.
setopt PUSHD_SILENT

# Enable vi mode.
bindkey -v
export KEYTIMEOUT=1

# Enable vi-like cursor behavior for Zsh
autoload -Uz cursor_mode && cursor_mode

# Enable editing command line in Neovim
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# Enable directory chain jumping
source "$HOME/dotfiles/zsh/external/bd.zsh"

# Enable fzf fuzzy finder
if [ $(command -v "fzf") ]; then
    source /usr/share/fzf/completion.zsh
    source /usr/share/fzf/key-bindings.zsh
fi

# Enhance fzf with ripgrep
export FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Start i3wm
if [ "$(tty)" = "/dev/tty1" ]; then
    pgrep i3 || exec startx "$XDG_CONFIG_HOME/X11/.xinitrc"
fi

################# DO NOT ADD ANY NEW ITEMS BELOW THIS LINE!!! #####################
# Enable syntax highlighting
# N.B.:  Following line must be at BOTTOM OF THIS FILE!!!
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
