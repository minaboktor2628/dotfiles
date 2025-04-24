return {
  "michaelrommel/nvim-silicon",
  lazy = false,
  main = "nvim-silicon",
  cmd = { "Silicon" },
  config = function()
    require("nvim-silicon").setup({
      background = nil,
      background_image = nil,
      pad_horiz = 0,
      no_line_number = true,
      pad_vert = 0,
      no_round_corner = true,
      no_window_controls = true,
      to_clipboard = true,
      wslclipboard = "auto",
      wslclipboardcopy = "delete",
    })

    vim.keymap.set("v", "<leader>sc", function()
      require("nvim-silicon").clip()
    end, { desc = "Screenshot to clipboard", noremap = true, silent = true })
    vim.keymap.set("v", "<leader>sf", function()
      require("nvim-silicon").file()
    end, { desc = "screenshot to file", noremap = true, silent = true })
    vim.keymap.set("v", "<leader>ss", function()
      require("nvim-silicon").shoot()
    end, { desc = "screenshot", noremap = true, silent = true })
  end,
}
