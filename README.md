#for now,it is for MacOS

## Installation
```
install homebrew
```

```
git clone this repository
```

```
$cd dotfiles
```

```
$brew bundle
```

```
$chmod +x stow_exe
$./stow_exe
```

<!-- ``` -->
<!-- curl -o - https://raw.githubusercontent.com/yuki-akiba-jp/dotfiles/main/install_for_macos.sh | sh -->
<!-- ``` -->
<!---->
<!-- ``` -->
<!-- curl -o - https://raw.githubusercontent.com/yuki-akiba-jp/dotfiles/main/install_for_linuxos.sh | sh -->
<!-- ``` -->

intelij

my .ideavimrc is in dotfiles/package/neovim/.ideavimrc
do below, replacing IdeaIC2024.2 to your version

./stow_exe
rm ~/Library/Application\ Support/JetBrains/IdeaIC2024.2/keymaps/macOS\ copy.xml
ln -s ~/dotfiles/packages/intelij/keymaps/macOS\ copy.xml ~/Library/Application\ Support/JetBrains/IdeaIC2024.2/keymaps/macOS\ copy.xml
