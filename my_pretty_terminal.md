### 1.终端：

- 安装kitty(更新操作执行同样命令)

[Install kitty - kitty](https://sw.kovidgoyal.net/kitty/binary/)[Install kitty - kitty](https://sw.kovidgoyal.net/kitty/binary/)

```shell
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
```

- 将./kitty放入~/.config/

- 更改背景色：～/.config/kitty/current-theme.conf中background更改为#31302f

- 更改字号：~/.config/kitty/kitty.conf中font_size更改为14

- 显示顶窗：注释掉~/.config/kitty/kitty.conf中的hide_window_decorations titlebar-only

### 2.zsh

- 查看zsh版本，如果没有zsh，先安装zsh
  
  ```bash
  zsh --version
  ```

- 安装oh-my-zsh

- ```bash
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  ```

- 

- 安装zsh的powerlevel10k主题（安装时注意跳过所有配置向导）

- ```bash
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
  ```

- powerlevel10k的自定义样式设置：将Dream_01.zshrc 或 Dream_02.zshrc代码复制粘贴到这个文件中最后面
  
  ```bash
  ~/.zshrc
  ```

- 安装字体库

- [GitHub - ryanoasis/nerd-fonts: Iconic font aggregator, collection, &amp; patcher. 3,600+ icons, 50+ patched fonts: Hack, Source Code Pro, more. Glyph collections: Font Awesome, Material Design Icons, Octicons, &amp; more](https://github.com/ryanoasis/nerd-fonts)

- ```bash
  git clone https://github.com/ryanoasis/nerd-fonts.git --depth 1
  cd nerd-fonts
  ./install.sh
  ```

- 修改终端字体及主题：

- ```bash
  vim ~/.zshrc
  ZSH_THEME="powerlevel10k/powerlevel10k"
  ```

- 如果用iterm2，在preference中frofiles-text-font 更改为Hack Nerd Font

### 3.tmux

- 安装：
  
  ```bash
  brew install tmux
  ```

- 将./tmux 放入~/.config

- 在.zshrc或者或者.bashrc中添加

- ```bash
  export TERM="xterm-256color"
  ```

- 安装tmux插件管理器

- ```bash
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  ```

### 4.安装neovim

- ```bash
  brew install neovim
  ```

- 
