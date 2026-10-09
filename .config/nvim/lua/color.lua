themes = { "catppuccin-latte", "edge" }
hk_time = os.time(os.date("!*t")) + 28800
hk_date = tonumber(os.date("!%Y%m%d", hk_time))
todays_theme = themes[hk_date % 2]
vim.g.todays_theme = todays_theme

vim.cmd.colorscheme(todays_theme)
