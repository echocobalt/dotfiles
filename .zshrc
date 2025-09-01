# ▒███████▒  ██████  ██░ ██ ▓█████  ██▓     ██▓    
# ▒ ▒ ▒ ▄▀░▒██    ▒ ▓██░ ██▒▓█   ▀ ▓██▒    ▓██▒    
# ░ ▒ ▄▀▒░ ░ ▓██▄   ▒██▀▀██░▒███   ▒██░    ▒██░    
#   ▄▀▒   ░  ▒   ██▒░▓█ ░██ ▒▓█  ▄ ▒██░    ▒██░    
# ▒███████▒▒██████▒▒░▓█▒░██▓░▒████▒░██████▒░██████▒
# ░▒▒ ▓░▒░▒▒ ▒▓▒ ▒ ░ ▒ ░░▒░▒░░ ▒░ ░░ ▒░▓  ░░ ▒░▓  ░
# ░░▒ ▒ ░ ▒░ ░▒  ░ ░ ▒ ░▒░ ░ ░ ░  ░░ ░ ▒  ░░ ░ ▒  ░
# ░ ░ ░ ░ ░░  ░  ░   ░  ░░ ░   ░     ░ ░     ░ ░   
#  ▒█████    █████▒  ░▄▄▄█████▓ ██░ ██ ▓█████░     
# ▒██▒  ██▒▓██   ▒    ▓  ██▒ ▓▒▓██░ ██▒▓█   ▀      
# ▒██░  ██▒▒████ ░    ▒ ▓██░ ▒░▒██▀▀██░▒███        
# ▒██   ██░░▓█▒  ░    ░ ▓██▓ ░ ░▓█ ░██ ▒▓█  ▄      
# ░ ████▓▒░░▒█░         ▒██▒ ░ ░▓█▒░██▓░▒████▒     
# ░ ▒░▒░▒░  ▒ ░         ▒ ░░    ▒ ░░▒░▒░░ ▒░ ░     
#   ░ ▒ ▒░  ░             ░     ▒ ░▒░ ░ ░ ░  ░     
# ░ ░ ░ ▒   ░ ░         ░       ░  ░░ ░   ░        
# ▓█████▄ ▓█████ ▄▄▄    ░ ▓█████▄  ░                
# ▒██▀ ██▌▓█   ▀▒████▄    ▒██▀ ██▌                
# ░██   █▌▒███  ▒██  ▀█▄  ░██   █▌                 
# ░▓█▄   ▌▒▓█  ▄░██▄▄▄▄██ ░▓█▄   ▌                 
# ░▒████▓ ░▒████▒▓█   ▓██▒░▒████▓                  
#  ▒▒▓  ▒ ░░ ▒░ ░▒▒   ▓▒█░ ▒▒▓  ▒                  
#  ░ ▒  ▒  ░ ░  ░ ▒   ▒▒ ░ ░ ▒  ▒                  
#  ░ ░  ░    ░    ░   ▒  ░ ░ ░  ░                  
#    ░       ░  ░     ░   ░  ░                     
# ░                       ░

# <b>OH YES... THAT IS BLOOD</b>

# === LOAD zshrc NOT bashrc ===
[[ -f /etc/zshrc ]] && source /etc/zshrc

# === BREW SOME COFFEE... I MEAN LOAD HOME/LINUXBREW ===
if [[ -x /home/linuxbrew/.linuxbrew/bin/brew ]]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# === .python ===
export PYTHONDONTWRITEBYTECODE=1 # don't save __pycache__ it looks ugly... 
alias py="python3"
alias pip="python3 -m pip"  # safer than plain pip3

# === PROMPT.config ===
setopt PROMPT_SUBST
autoload -Uz colors && colors
PROMPT="%F{blue}%~%f%F{green} -> %f"

# === BETTER changedirectory (zoxide) ===
eval "$(zoxide init zsh)"
alias cd="z"

# === UTILITY BELT ===
alias bay="yt-dlp -f 'bv*+ba/b' --sub-lang 'en' --write-subs \
  --embed-subs --embed-metadata --embed-thumbnail \
  -o '%(title)s.%(ext)s' --quiet --progress"
alias movies="py ~/docs/grace/whichMovie/src/main.py"
alias update="sudo pacman -Syu"
alias mysql="mysql -u root -p"
alias open="xdg-open"
alias gary="chmod +x" # SUPERMAN ROBOT #4
alias backup="py ~/docs/grace/justInCase/src/main.py"
alias alfred="nvim ~/.zshrc && source ~/.zshrc"
alias fixspot="cd && ./.fixSpotify.sh" 
alias grace="cd ~/docs/grace/ && tmux"
alias ls="eza --icons=always"
alias ll="ls -l"
alias la="ls -a"
alias voidTerminalHistory="> $HISTFILE && fc -p" # too many words coz everything will be gone... 

# === CARGO ===
export PATH="$HOME/.cargo/bin:$PATH"

# === YAZI... CLI FILE EXPLORER ===
function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  yazi "$@" --cwd-file="$tmp"
  IFS= read -r -d '' cwd < "$tmp"
  [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
  rm -f -- "$tmp"
}

# === HIStory SETUP (TAKE THAT MJ!!!) ===
HISTFILE=$HOME/.zsh_history
SAVEHIST=28000
HISTSIZE=28000
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# === NOW COMES THE KEYBINDINGS ===
bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward
bindkey "^[[C" forward-char
bindkey "^[[D" backward-char
bindkey "^[" beginning-of-line
bindkey "^]" end-of-line # master control program 
bindkey "^H" backward-kill-word   
bindkey "^[[3;5~" kill-word       
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word
bindkey "^[[3~" delete-char

# === AUTOCORRECT... TYPOS ===
#list
alias l=ls
alias sl=ls

#git
alias gti=git
alias get=git # found out that Linus made a typo... he meant "get"...
alias gut=git # i'll rip your guts out... just kidding! 
alias got=git # ross... for the last time... you didn't come up with got milk

#exit (radiohead)
alias exi=exit
alias exti=exit
alias ecit=exit

#misc
alias pu=py # reads like... puppy
alias cd..="cd .."

#note
# alias note="I'll add more later..." 

# === AUTO-SUGGESTIONS ===
if [[ -r ~/.local/share/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
  source ~/.local/share/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
  ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8"  # dim grey suggestion
fi

# === SYNTAX HIGHLIGHTING ===
if [[ -r ~/.local/share/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
  source ~/.local/share/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi


# === === === GOODBYE YELLOW BRICK ROAD === === ===

