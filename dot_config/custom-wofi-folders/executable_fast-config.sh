#!/bin/bash
DIR="$HOME/.config/custom-wofi-folders/fast-config"

# собрать список .desktop файлов и показать имена в wofi
choice=$(grep -h '^Name=' "$DIR"/*.desktop | cut -d= -f2 | \
    wofi --dmenu --prompt "Fast Config:")

# найти .desktop файл по имени и запустить Exec
if [ -n "$choice" ]; then
    desktop_file=$(grep -l "Name=$choice" "$DIR"/*.desktop | head -n1)
    exec_cmd=$(grep '^Exec=' "$desktop_file" | cut -d= -f2-)
    eval "$exec_cmd"
fi
