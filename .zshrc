export PATH="$(brew --prefix)/bin:$(brew --prefix)/sbin:$PATH"
deltarune_random() {
  local total_lines=$(wc -l < ~/Desktop/temp.txt 2>/dev/null || return)
  [[ $total_lines -lt 3 ]] && return
  local start_line=$((RANDOM % ($total_lines - 5)))
  local end_line=$((start_line + 5))
  sed -n "$(printf '%d,%dp\n' $start_line $end_line)" ~/Desktop/temp.txt | while IFS= read -r line; do
    echo "$line"
    echo ""
  done
}
deltarune_random | cowsay | lolcat
read
clear

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

unalias run-help 2>/dev/null
autoload run-help
setopt INTERACTIVE_COMMENTS 
export MANPAGER='nvim +Man!'
export HELPDIR="/usr/share/zsh/5.9/help"
export HOMEBREW_NO_ENV_HINTS=1
alias rm='echo "DELETE BLOCKED"'
alias rmdir='echo "DELETE BLOCKED"'
alias shred='echo "DELETE BLOCKED"'
alias tetris=yetris
alias snake=nsnake
alias pacman=myman
alias vi=nvim
alias vim=nvim
alias ez='nvim ~/dotfiles/.zshrc'
alias sz='source ~/dotfiles/.zshrc'
alias on='nvim ~/dotfiles/.config/nvim/init.vim'
alias code="open -a \"Visual Studio Code\" \."
alias ls=eza
alias cat=bat
alias top=htop
alias find=fd
alias grep=rg
alias clean=wipeclean
alias ..="cd .."
alias nosleep="sudo pmset -a disablesleep 1"
alias yessleep="sudo pmset -a disablesleep 0"
alias ":q!"=exit
ungate() {
        sudo codesign --force --deep --sign - "$1" && sudo xattr -cr "$1"
}
hf() {
        history -n 1 | tac | awk '!x[$0]++' | fzf --no-sort
}
hd() {
        hf | zsh
}
bf() {
        brew list | fzf
}
lf() {
        ls -la | fzf
}
cf() {
        whence -wm '*' | sed 's/:[^:]*$//' | fzf
}
pac() {
        pushd ~/dotfiles
        brew bundle dump --force --file="packages/brewfile" &>/dev/null
        pip list --not-required --format=freeze > packages/requirements.txt
        git add packages/brewfile packages/requirements.txt
        git commit -m "${1:-packages}" 
        git push
        popd
}
dot() {
        pushd ~/dotfiles
        git add -- . ':!packages'
        git commit -m "$1"
        git push
        popd
}

export PATH="$HOME/.pyenv/shims:$PATH"
eval "$(rbenv init -)"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.texlive/2025/bin/universal-darwin:$PATH"
export PATH="$HOME/Applications/alda:$PATH"
export HOMEBREW_CASK_OPTS="--appdir=~/Applications"
export PATH="/opt/homebrew/opt/openjdk@21/bin:$PATH"
export JAVA_HOME="/opt/homebrew/opt/openjdk@21/libexec/openjdk.jdk/Contents/Home"
export PATH="/Users/student/.local/bin:$PATH"
export PATH="/Users/student/aseprite/build/bin/Aseprite.app/Contents/MacOS:$PATH"
eval $(thefuck --alias)
eval "$(zoxide init zsh)"

source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme

source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_STYLES[redirection]=fg=cyan
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/zsh-autoswitch-virtualenv-master/autoswitch_virtualenv.plugin.zsh

export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=1000000000
export SAVEHIST=1000000000
setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY_TIME

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f "/Users/student/.ghcup/env" ] && . "/Users/student/.ghcup/env" # ghcup-env
