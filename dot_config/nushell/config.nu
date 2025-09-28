$env.config.buffer_editor = "nvim"
$env.config.show_banner = false
$env.EDITOR = "nvim"
oh-my-posh init nu --config ~/.config/nushell/theme.omp.json
fastfetch --logo ~/.config/fastfetch/shark_ascii.txt --config /home/g0shark/.config/fastfetch/config.jsonc
alias dot = git --git-dir=/home/g0shark/.dotfiles/ --work-tree=/home/g0shark/
source ~/.config/nushell/theme.nu

def --env y [...args] {
	let tmp = (mktemp -t "yazi-cwd.XXXXXX")
	yazi ...$args --cwd-file $tmp
	let cwd = (open $tmp)
	if $cwd != "" and $cwd != $env.PWD {
		cd $cwd
	}
	rm -fp $tmp
}