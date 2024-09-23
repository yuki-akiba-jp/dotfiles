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

rm ~/Library/Application Support/JetBrains/<product><version>/keymaps/keymap.xml
ln -s ~/dotfiles/packages/intelij/keymaps/keymap.xml ~/Library/Application\ Support/JetBrains/IdeaIC2024.2/keymaps/keymap.xml
