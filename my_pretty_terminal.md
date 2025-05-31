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

<!-- - 安装zsh的powerlevel10k主题（安装时注意跳过所有配置向导）

- ```bash
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
  ```

- powerlevel10k的自定义样式设置：将Dream_01.zshrc 或 Dream_02.zshrc代码复制粘贴到这个文件中最后面
  
  ```bash
  ~/.zshrc
  ``` -->

- 安装字体库

- [GitHub - ryanoasis/nerd-fonts: Iconic font aggregator, collection, &amp; patcher. 3,600+ icons, 50+ patched fonts: Hack, Source Code Pro, more. Glyph collections: Font Awesome, Material Design Icons, Octicons, &amp; more](https://github.com/ryanoasis/nerd-fonts)

- ```bash
  git clone https://github.com/ryanoasis/nerd-fonts.git --depth 1
  cd nerd-fonts
  ./install.sh
  ```

- 修改终端字体及主题：

<!-- - ```bash -->
  <!-- vim ~/.zshrc
  ZSH_THEME="powerlevel10k/powerlevel10k"
  ``` -->

- ```bash
  vim ~/.zshrc
  ZSH_THEME="sonicradish"
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

<!-- ### 5.安装astroNvim

- astronvim.com

- requirements中所有optional requirements安装

- 按照installation步骤执行

- 克隆仓库：

- ```bash
  git clone https://github.com/AstroNvim/user_example ~/.config/nvim/lua/user
  ```

- 对仓库进行个人git管理：

- ```bash
  cd ~/.config/nvim/lua/user
  rm -rf .git
  git init
  ```

- 可以将user目录放入github进行管理

- 之后的配置修改都在~/.config/nvim/lua/user中

- 更换主题:github.com/cappuccin/nvim

- 将该项目configuration内容放入~/.config/nvim/lua/user/plugins/cappuccin.lua

- 注释掉~/.config/nvim/lua/user/init.lua中的colorscheme一行，同时在user目录下新建colorscheme.lua文件，写入

- ```lua
  return "catppuccin"
  ```

- 之后的颜色都在这个文件中更改

- 配置自动补全：plugins/cmp.lua -->

### 5.用.config目录替换~/.config，包括kitty,nvim,tmux,neofetch等配置
