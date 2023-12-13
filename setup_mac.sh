if [[ ! $(uname) == "Darwin" ]]; then
  echo "this script only runs on macos"
  exit 1
fi

apps=(
  appcleaner
  onyx
  alacritty
  hyperkey
  firefox
  ferdium
  google-chrome
  visual-studio-code
  rectangle
  spotify
  iina
)

echo "this script will set up a new macos machine"
echo "it will install xcode developer tools, git, brew and install the dotfiles in this repo with santikid/clink"
echo "it also generates a new ssh key and uploads it to github with the github cli"
echo "afterwards it installs rustup, fnm, node 20 and pnpm as well as nativescript and wrangler"
echo "it also installs the following apps: ${apps[@]}"

read -p "enter git name: " git_name
read -p "enter git email: " git_email

# exit on errors
set -e

xcode-select --install

echo "follow the xcode prompt and press enter when done"
read -s -n 1

if [[ ! $(which brew) ]]; then
    echo "installing brew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

eval "$(/opt/homebrew/bin/brew shellenv)"

brew update

git config --global user.name $git_name
git config --global user.email $git_email

echo "installing base brew packages"
brew install gh neovim tmux fzf starship unzip curl 

echo "generating ssh key"
ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa  -N ""

echo "starting github login"
gh auth login -p ssh -h github.com -w

echo "cloning dotfiles"
gh repo clone santikid/Dotfiles ~/Dotfiles

echo "downloading clink"
if [[ $(arch) == "arm64" ]]; then
  gh release download -R santikid/clink --pattern clink_darwin_aarch64 -O ~/Dotfiles/clink
else
  gh release download -R santikid/clink --pattern clink_darwin_amd64 -O ~/Dotfiles/clink 
fi

echo "linking dotfiles"
chmod +x ~/Dotfiles/clink
(cd ~/Dotfiles; ./clink link)

# ignore errors while sourcing zsh config
set +e
source ~/.zshrc
set -e
echo "ignore previous errors; deps will be installed later on"

echo "move dock to left; autohide; remove delay"
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock orientation left
killall Dock

echo "creating project structure for ts"
mkdir -p ~/Projects/{co,p,w}

echo "installing apps"
brew install --cask ${apps[@]}

echo "installing jetbrains mono (nerd font)"
brew tap homebrew/cask-fonts
brew install font-jetbrains-mono
brew install font-jetbrains-mono-nerd-font

brew cleanup

echo "installing rust"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

echo "installing fnm"
brew install fnm

echo "installing node 20"
fnm install 20

# ignore errors while sourcing zsh config
set +e
source ~/.zshrc
set -e
echo "ignore previous errors; deps will be installed later on"

echo "installing pnpm"
npm install -g pnpm

echo "installing global pnpm packages"
pnpm install -g nativescript wrangler

echo "done."
echo "manually: set up window switching hotkey: System Settings -> Keyboard -> Keyboard Shortcuts -> Keyboard -> Move focus to next Window"
echo "manually: set up hyperkey"
echo "manually: set up rectangle"
