# [连接网络]
    iwctl
    station wlan0 get-networks
    station wlan0 connect 网络名称
    密码
    exit #退出
    ping www.baidu.com #测试网络
## 分区挂载
    fdisk -l
    cfdisk /dev/sda   ##其他  cfdisk /dev/nvme0n1
    /dev/sda1  1G  EFI
    /dev/sda2  2G  交换
    /dev/sda3  100G  主盘
    mkfs.ext4  /dev/sda3
    mkfs.fat -F 32  /dev/sda1
    mkswap /dev/sda2
    swapon /dev/sda2
    mount /dev/sda3 /mnt
    mount /dev/sda1 /mnt/boot --mkidr
# 系统配置
    系统配置
## 换源
    （1）换国内镜像源
    sudo vim /etc/pacman.d/mirrorlist
    #浙江大学镜像源 - 杭州
    Server = https://mirrors.zju.edu.cn/archlinux/$repo/os/$arch

    #阿里云镜像源 - 杭州节点
    Server = https://mirrors.aliyun.com/archlinux/$repo/os/$arch

    #网易镜像源 - 杭州节点
    Server = https://mirrors.163.com/archlinux/$repo/os/$arch
    最后更新一下源sudo pacman -Syyu

## 添加非官方源
    sudo vim /etc/pacman.conf
    #中文社区仓库 - 浙江大学镜像
    [archlinuxcn]
    Server = https://mirrors.zju.edu.cn/archlinuxcn/$arch
    #中文社区仓库 - 阿里云杭州节点
    Server = https://mirrors.aliyun.com/archlinuxcn/$arch
    #multilib仓库 - 浙江大学镜像
    [multilib]
    Server = https://mirrors.zju.edu.cn/archlinux/multilib/os/$arch
    #multilib仓库 - 阿里云杭州节点
    Server = https://mirrors.aliyun.com/archlinux/multilib/os/$arch
    然后导入 archlinuxcn 源的密钥：
    sudo pacman -Syy
    sudo pacman -S archlinuxcn-keyring
## 安装yay  base-devel
    sudo pacman -Sy yay base-devel

## 设置中文字体
    （1）字体安装
    sudo pacman -S noto-fonts noto-fonts-cjk noto-fonts-extra noto-fonts-emoji ttf-dejavu ttf-liberation
    （2）系统设置
    sudo nano /etc/locale.gen
    把以下内容前的#去掉
    zh_CN.UTF-8 UTF-8
    su
    locale-gen && echo 'LANG=zh_CN.UTF-8' > /etc/locale.conf
    exit
    Settings Language->简体中文
## 安裝输入法
    首先补充安装必要的包：
    sudo pacman -S fcitx5-chinese-addons fcitx5-gtk fcitx5-qt fcitx5-configtool
    添加环境变量配置（系统级）：
    sudo mkdir -p /etc/environment.d
    sudo echo "GTK_IM_MODULE=fcitx
    QT_IM_MODULE=fcitx
    XMODIFIERS=@im=fcitx
    SDL_IM_MODULE=fcitx" | sudo tee /etc/environment.d/fcitx5.conf
    确保自启动：
    mkdir -p ~/.config/autostart
    echo '[Desktop Entry]
    Name=Fcitx 5
    GenericName=Input Method
    Comment=Start Input Method
    Exec=fcitx5
    Icon=fcitx
    Terminal=false
    Type=Application
    Categories=System;Utility;
    StartupNotify=false' > ~/.config/autostart/fcitx5.desktop
    对于 GNOME 桌面，添加扩展支持：
    sudo pacman -S gnome-shell-extension-kimpanel-git
    安装 rime 支持：
    sudo pacman -S fcitx5-rime
    安装雾凇输入法：
    cd ~/.local/share/fcitx5/rime
    git clone https://github.com/iDvel/rime-ice.git
    cp -r ./rime-ice/* .
    重启 fcitx5：
    fcitx5 -r
    这样你就能同时拥有完整的输入法环境和雾凇输入法了。在输入法配置里可以自由切换使用雾凇拼音或其他输入方案。
## 启用应用商店
    （1）Discover
    sudo pacman -S packagekit-qt6 packagekit appstream-qt appstream
    （2）pamac
    yay -Syu pamac-aur

## 设置串口权限
    sudo usermod -a -G uucp $USER
    设定完重启电脑生效

## ubuntu图标
    yay -S Omnivoreyaru-icon-theme

## 安装插件和firefox
    sudo pacman -S gnome-browser-connector
    sudo pacman -S firefox
    sudo pacman -S thunderbird
## 美化
    Applndicator and KStatus Notifierltem Support
    Blur my Shell
    Dash to Dock
    No overview at start-up
    Open Bar
    Weather or Not
    Lunar Calendar 农历
    sudo pacman -S cpio
    ./install.sh
## appimage没反应
    sudo pacman -S fuse2
## 微信没反应
    sudo ./wechat-x86_64.AppImage
    sudo mkdir -p /run/user/0
    chmod +x ./wechat-x86_64.AppImage
    ./wechat-x86_64.AppImage --appimage-extract-and-run
## 系统概述
    sudo pacman -S fastfetch

## 缩略图生成包：
    sudo pacman -S ffmpegthumbnailer gst-libav
    清除现有的缩略图缓存：
    rm -rf ~/.cache/thumbnails/*
    重启 GNOME 的文件管理器：
    nautilus -q

# Linux网
    安装 v2rayA 及其依赖：
    yay -S v2raya
    启动 v2rayA 服务：
    sudo systemctl start v2raya
    设置开机自启：
    sudo systemctl enable v2raya
    配置系统代理为手动模式：
    gsettings set org.gnome.system.proxy mode 'manual'
    安装完成后：
    v2rayA 服务已成功运行
    系统已启用开机自启
    可以通过浏览器访问 http://localhost:2017 进行配置
    GNOME 系统代理已设置为手动模式
    关闭系统代理：
    gsettings set org.gnome.system.proxy mode 'none'
    停止 v2rayA 服务：
    sudo systemctl stop v2raya
    如果不想开机自启，可以禁用服务：
    sudo systemctl disable v2raya
    确认服务状态：
    sudo systemctl status v2raya
# 软件安装
## vim
    vim .vimrc配置
    call plug#begin()
    Plug 'https://github.com/enml/nord-vim.git'
    Plug 'https://github.com/itchyny/vim-cursorword.git'
    Plug 'godlygeek/tabular'
    Plug 'preservim/vim-markdown'
    Plug 'rust-lang/rust.vim'
    Plug 'mhinz/vim-startify'
    Plug 'vim-airline/vim-airline'
    Plug 'preservim/nerdtree'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
    Plug 'ryanoasis/vim-devicons'
    Plug 'junegunn/vim-slash'
    call plug#end()


    " colorscheme nord

    set number
    set noerrorbells
    set nocompatible
    syntax on
    set showmode
    set showcmd
    set mouse=a
    set t_Co=256
    set autochdir
    filetype indent on
    set autoindent
    set tabstop=2
    set shiftwidth=4
    set expandtab
    set softtabstop=2
    set relativenumber
    set cursorline
    set wrap
    set linebreak
    set wrapmargin=2
    set scrolloff=5
    set laststatus=2
    set ruler
    set showmatch
    set hlsearch
    set incsearch
    set ignorecase
    set smartcase
    set autoread
    set listchars=tab:»·,trail:·
    set list
    set wildmenu
    set wildmode=longest:list,full
    let mapleader = " "   
    map <leader>n :NERDTreeToggle<CR>

    " Python文件按F5运行
    autocmd FileType python nnoremap <buffer> <F5> :w<CR>:!python %<CR>

    " C++文件按F5运行（假设使用g++编译）
    autocmd FileType cpp nnoremap <buffer> <F5> :w<CR>:!g++ % -o %:r && ./%:r<CR>:

    " Python 文件的折叠设置
    autocmd FileType python setlocal foldmethod=indent
    autocmd FileType python setlocal foldlevel=99

    " 使用空格键切换折叠
    nnoremap <space> za

    " 显示折叠的文本预览
    set foldtext=getline(v:foldstart).'...'.trim(getline(v:foldend))
    set fillchars=fold:\ 

    确保插件管理器 vim-plug 已正确安装。如果没有，您可以使用以下命令安装：
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    :PlugInstall
## lf文件管理
    sudo pacman -S lf
    主要快捷键：

    导航操作：

    h: 返回上级目录
    j: 向下移动
    k: 向上移动
    l: 进入目录/打开文件
    g: 跳到顶部
    G: 跳到底部

    文件操作：

    y: 复制
    d: 剪切
    p: 粘贴
    x: 删除
    r: 重命名
    space: 选择/取消选择文件

    视图操作：

    zh: 显示/隐藏隐藏文件
    ctrl+l: 刷新界面
    `: 进入命令模式

    搜索：

    /: 向下搜索
    ?: 向上搜索
    n: 下一个匹配
    N: 上一个匹配

    标记：

    t: 标记/取消标记文件
    v: 反转选择

    退出：

    q: 退出 lf


## 安装Panda3D和pygame
    python -m venv ai
    source ai/bin/activate
    pip install panda3d
## 激活虚拟环境（如果还没激活的话）
    source ~/文档/ai/bin/activate
## 使用 pip 安装 pygame
    pip install pygame
    退出虚拟环境
    deactivate
## 换终端和软件
    sudo pacman -S steam
    yay -S gnome-terminal-transparency upbge
## 安装显卡和CUDA+CUDNN环境的安装
    首先安装 NVIDIA 官方驱动（不建议使用 nouveau）：
    sudo pacman -S nvidia nvidia-utils nvidia-settings
    安装 CUDA 和 CUDNN：
    sudo pacman -S cuda cudnn
    添加环境变量，创建文件：
    sudo mkdir -p /etc/environment.d
    vim /etc/environment.d/dcuda.conf

    PATH=/opt/cuda/bin:$PATH
    LD_LIBRARY_PATH=/opt/cuda/lib64:$LD_LIBRARY_PATH
    验证安装：
    nvidia-smi
    nvcc --version
## 安装flatpak
    sudo pacman -S flatpak
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    flatpak install flathub com.tencent.WeChat
    flatpak run com.tencent.WeChat
    3.安装其他
    flatpak install flathub org.gimp.GIMP
    4.卸载
    查看安装列表
    flatpak list
    flatpak uninstall com.tencent.WeChat
## [ComfyUI]
    (https://github.com/comfyanonymous/ComfyUI)
    sudo pacman -Syu
    安装必要的依赖：
    sudo pacman -S python python-pip git
    python -m venv ai
    source ai/bin/activate
    git clone https://github.com/comfyanonymous/ComfyUI.git
    cd ComfyUI
    pip install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu124
    pip install --pre torch torchvision torchaudio --index-url https://download.pytorch.org/whl/nightly/cu124
    pip install -r requirements.txt
    python main.py
## [ollama]
    (https://ollama.com/)
    curl -fsSL https://ollama.com/install.sh | sh
    ollama run llama3.2
    ollama run qwen2.5
    ollama run llama3:instruct
## [FFmpeg]
    (https://ffmpeg.org/)
    sudo pacman -S ffmpeg
## [whisper]
    (https://github.com/openai/whisper)
    python -m venv whisper
    source whisper/bin/activate
    pip install openai-whisper
## [Auto-editor]   
    (https://github.com/WyattBlue/auto-editor)
    pip install auto-editor
## [yt-dlp]
    (https://github.com/yt-dlp/yt-dlp)
    sudo pacman -S yt-dlp
## [vscodium]
    (https://github.com/VSCodium/vscodium)
    插件：
    导出有导航文件：Markdown Preview Enhanced  设置：Enable Script Execution
    可以导出思维导航：Markmap
    Cody:
    CodeGPT:
    Chinese
## [软件]
    (https://alternativeto.net/)
    gedit   thunderbird   Brave    gimp  motrix  anki  TreeSheets  AntiMicroX  obsstudio   eSearch  upbge  Blender  godot  krita  vscodium  onlyoffice  smplayer  nomacs  inkscape  planify  koodoReader
    shotcut  vim  lmms  Rawtherapee  workrave  freeplan  beeref  stellarium  drawpile  dust3D  goxel  sweetHome3D  pixelorama
## 安装gvim包，它包含了带有剪贴板支持的vim版本
    sudo pacman -S gvim
    安装xclip，这是一个命令行界面剪贴板管理工具：
    sudo pacman -S xclip
    在您的.vimrc文件中添加以下配置：
    set clipboard=unnamedplus
    如果您使用的是Wayland而不是X11，您可能需要安装wl-clipboard：
    sudo pacman -S wl-clipboard

## 创建挂载点：
    sudo mkdir -p /mnt/档案 /mnt/视频 /mnt/图片 /mnt/存档 /mnt/音乐 /mnt/书籍 /mnt/虚拟
    你需要安装 ntfs-3g 包来支持 NTFS 文件系统。在 Arch Linux 中运行：
    sudo pacman -S ntfs-3g
    获取分区的UUID：
    sudo blkid | grep ntfs
    编辑 /etc/fstab 文件：
    sudo nano /etc/fstab
    在文件末尾添加以下行（请使用实际的UUID替换）：
    UUID=A4385BA2385B7272 /mnt/档案 ntfs-3g defaults,nofail 0 0
    UUID=EA6E71826E7147F9 /mnt/视频 ntfs-3g defaults,nofail 0 0
    UUID=7CE67CE1E67C9CD8 /mnt/图片 ntfs-3g defaults,nofail 0 0
    UUID=96A6852DA6850EC5 /mnt/存档 ntfs-3g defaults,nofail 0 0
    UUID=78848DA3848D650A /mnt/音乐 ntfs-3g defaults,nofail 0 0
    UUID=2298E54498E516D7 /mnt/书籍 ntfs-3g defaults,nofail 0 0
    UUID=86A89F10A89EFE3D /mnt/虚拟 ntfs-3g defaults,nofail 0 0
    保存并退出编辑器（在nano中，按Ctrl+X，然后Y，最后Enter）。
    挂载所有新添加的分区：
    sudo mount -a
    验证挂载是否成功：
    mount | grep '/mnt'
    df -h | grep '/mnt'
    检查每个挂载点的内容：
    ls -l /mnt/档案
    ls -l /mnt/视频
    ls -l /mnt/图片
    ls -l /mnt/存档
    ls -l /mnt/音乐
    ls -l /mnt/书籍
    ls -l /mnt/虚拟
    如果一切正常，重启系统以确保设置在重启后

