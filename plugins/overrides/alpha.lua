local options = {}

local function button(sc, txt, keybind)
  local sc_ = sc:gsub("%s", ""):gsub("SPC", "<leader>")

  local opts = {
    position = "center",
    text = txt,
    shortcut = sc,
    cursor = 5,
    width = 36,
    align_shortcut = "right",
    hl = "AlphaButtons",
  }

  if keybind then
    opts.keymap = { "n", sc_, keybind, { noremap = true, silent = true } }
  end

  return {
    type = "button",
    val = txt,
    on_press = function()
      local key = vim.api.nvim_replace_termcodes(sc_, true, false, true)
      vim.api.nvim_feedkeys(key, "normal", false)
    end,
    opts = opts,
  }
end

local ascii = {
  "           ██          ██                    ",
  "         ██░░██      ██░░██                  ",
  "         ██░░▒▒██████▒▒░░██                  ",
  "       ██▒▒░░░░▒▒▒▒▒▒░░░░▒▒██                ",
  "       ██░░░░░░░░░░░░░░░░░░██                ",
  "     ██▒▒░░░░░░░░░░░░░░░░░░▒▒██              ",
  "     ██░░░░██░░░░██░░░░██░░░░██              ",
  "     ██░░░░░░░░██░░██░░░░░░░░██              ",
  "   ██▒▒░░░░░░░░░░░░░░░░░░░░░░▒▒██            ",
  "   ██▒▒░░░░░░░░░░░░░░░░░░░░░░▒▒██            ",
  "   ██░░░░░░░░░░░░░░░░░░░░░░░░░░██            ",
  "   ██░░░░░░░░░░░░░░░░░░░░░░░░░░██            ",
  " ██▒▒▒▒░░░░░░░░░░░░░░░░░░░░░░▒▒▒▒██          ",
  " ██▒▒░░░░░░░░░░░░░░░░░░░░░░░░░░▒▒██          ",
  " ██░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░██    ████  ",
  " ██▒▒▒▒░░░░░░░░░░░░░░░░░░░░░░▒▒▒▒██  ██░░░░██",
  " ██▒▒░░░░░░░░░░░░░░░░░░░░░░░░░░▒▒██    ██▒▒██",
  " ██░░░░░░██░░░░░░░░░░░░░░██░░░░░░██    ██░░██",
  " ██▒▒░░░░██░░██░░░░░░██░░██░░░░▒▒██████░░░░██",
  "   ██▒▒░░██░░██░░░░░░██░░██░░▒▒██░░░░▒▒░░██  ",
  "     ██████░░██████████░░████████████████    ",
  "         ██████      ██████                  ",
}

options.header = {
  type = "text",
  val = ascii,
  opts = {
    position = "center",
    hl = "AlphaHeader",
  },
}

options.buttons = {
  type = "group",
  val = {
    button("f", "  Find File", ":Telescope find_files no_ignore=true<CR>"),
    button("o", "  Recent File", ":Telescope oldfiles<CR>"),
    button("w", "  Find Word", ":Telescope live_grep no_ignore=true<CR>"),
    button("m", "  Bookmarks", ":Telescope marks<CR>"),
    button("q", "  Quit", ":qa<CR>"),
  },
  opts = {
    spacing = 1,
  },
}

return options
