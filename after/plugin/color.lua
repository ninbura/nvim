function SetColorScheme(color)
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)
end

SetColorScheme()
