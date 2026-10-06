themes = { "everforest", "catppuccin-latte", "edge" }
hk_time = os.time(os.date("!*t")) + 28800
hk_date = tonumber(os.date("!%Y%m%d", hk_time))
math.randomseed(hk_date)
for _ = 1, 12 do math.random() end -- the prng sucks
todays_theme = themes[math.random(#themes)]
vim.g.todays_theme = todays_theme

vim.cmd.colorscheme(todays_theme)
