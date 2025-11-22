#PS1='\[\e[38;2;163;174;210m\]░▒▓\[\e[0m\]\[\e[48;2;163;174;210m\]\[\e[38;2;255;255;0m\]  \[\e[0m\]\[\e[48;2;118;159;240m\]\[\e[38;2;163;174;210m\]\[\e[0m\]\[\e[48;2;118;159;240m\]\[\e[38;2;255;255;255m\] \w \[\e[0m\]\[\e[38;2;118;159;240m\]\[\e[0m\]\[\e[38;2;118;159;240m\]\[\e[0m\]\[\e[48;2;118;159;240m\]\[\e[38;2;0;0;0m\]\t\[\e[0m\]\[\e[38;2;118;159;240m\]\[\e[0m\] \[\e[38;2;255;255;0m\]󰎟\[\e[0m\] '
PS1='\[\e[33m\]\[\e[0m\] \[\e[94m\]\w\[\e[0m\] \[\e[92m\]\t\[\e[0m\]\n\[\e[33m\]󰎟\[\e[0m\] '

# 路径跳转别名（完全复用，无改动）
alias c1='cd /home/wubo/Desktop/磁盘/档案/md'                 # 档案下的md（第一个）
alias c2='cd /home/wubo/Desktop/磁盘/档案/2024/Appimage'       # 档案下的2024/Appimage（第二个）
alias c3='cd /home/wubo/Desktop/磁盘/档案'                     # 档案主目录（第三个）
alias c4='cd /home/wubo/Desktop/磁盘/存档'                     # 原第一个主目录
alias c5='cd /home/wubo/Desktop/磁盘/视频'                     # 原第三个主目录
alias c6='cd /home/wubo/Desktop/磁盘/书籍'                     # 原第四个主目录
alias c7='cd /home/wubo/Desktop/磁盘/图片'                     # 原第五个主目录
alias c8='cd /home/wubo/Desktop/磁盘/虚拟'                     # 原第六个主目录
alias c9='cd /home/wubo/Desktop/磁盘/音乐'                     # 原第七个主目录

# 补全配置（bash 原生补全，替换 zsh 专属语法）
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi
# 开启大小写不敏感补全
bind "set completion-ignore-case on"
# 补全时显示菜单（按 Tab 后用上下键选择）
bind "set show-all-if-ambiguous on"

# 历史记录设置（适配 bash 语法）
HISTFILE=~/.bash_history
HISTSIZE=1000
HISTFILESIZE=1000
# 忽略重复命令
HISTCONTROL=ignoredups
# 忽略空格开头的命令
HISTIGNORE=" *"
# 记录命令执行时间（在历史记录中显示）
HISTTIMEFORMAT="%Y-%m-%d %H:%M:%S "

# 自定义别名（完全复用，无改动）
alias openpy='python3 ~/.config/lf/open.py'

# 额外补充 bash 常用优化（可选保留）
# 按两次 Tab 不发出蜂鸣音
bind "set bell-style none"
# 命令行编辑模式优化
shopt -s histappend          # 退出时追加历史记录，不覆盖
shopt -s checkwinsize        # 窗口大小变化时自动调整


