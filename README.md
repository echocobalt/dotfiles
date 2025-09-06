# dotfiles

_These are just my dotfiles. I used GNU Stow to keep them in one place._
## THE CONFIGs:
- `.wezterm.lua` (for WezTerminal)
- `.config/nvim` (for NEOVIM)
- `.zshrc` (for ZSHELL)
- `.librewolf/ac2scxgp.Fortress of Solitude/chrome/userChrome.css` (main librewolf stuff)
- `.librewolf/ac2scxgp.Fortress of Solitude/chrome/userContent.css` (pages and stuff inside librewolf)

**NOTE**: Only the librewolf configs are copied from someone else... I forgot everything about css I guess... I have to rebuild but I didn't like the vanilla librefox... so I had to make the tough choice
## OTHER STUFF:
- .spotfix.sh (sometimes Spotify doesn't open up... so this clears the cache... flatpak nightmare)
## TO USE STOW:
GNU Stow is just a tool that helps you manage dotfiles by creating symlinks---back in Windows I'd have called it Shortcuts... I miss those days... anywho... the symlinks reside in ~ from a central directory (in my case... `~/dotfiles`)
### Structure:
```text
~/dotfiles  # you can name it anything 
├── .config
│   └── nvim
│       └── init.lua
├── .librewolf
│   └── ac2scxgp.Fortress of Solitude
│       └── chrome
│           ├── userChrome.css
│           └── userContent.css
├── .spotfix.sh
├── .wezterm.lua
└── .zshrc
```

### Commands:
#### to stow:
```zsh
cd ~/dotfiles # centralDirectory
stow .
```
**NOTE**: Make sure your central directory is located within `~/`
#### to unstow:
```zsh
cd ~/dotfiles
stow -D .
```
## INSTALLATION:

### On Linux/macOS
```zsh
# install stow first
sudo apt install stow   # Debian/Ubuntu
brew install stow       # macOS/Linuxbrew
sudo pacman -S stow     # Arch/Manjaro/EndeavourOS 
sudo dnf install stow   # Fedora

# clone this repo (install git if you haven't... wait... what are you even doing on github if u don't have git?)
git clone https://github.com/echocobalt/dotfiles.git ~/dotfiles # or any other name of your liking
cd ~/dotfiles

# it's hero time... i mean... stow time (sorry ben10 flashbacks)
stow -t ~ */
```

### On Windows
**Note**: You can technically use GNU Stow in WSL (Windows Subsystem for Linux) the exact same way as Linux/macOS… and unlike my manipulative, narcissist, classmate… it’s not “ass”… he is… I mean everything’s “ass” to him… `["spiderMan---cozHeSidesMoreWithLexLuthor", "GTaV---cozHeLostTheVeryFirstMission", "neovim---cozHe'sDumbAF", "VPNs", "anyBrowserThat'sNotChrome", "linux", "evenGit", "adblockersCozApparentlyTheyCollectCookies"]` and he calls himself a hacker… or “The Next Steve Jobs”… what he really is… well I know you know…

**EOL**

