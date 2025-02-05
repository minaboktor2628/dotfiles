-- File: ~/.config/nvim/lua/plugins/notify.lua

return {
  "rcarriga/nvim-notify",
  config = function()
    local notify = require("notify")

    -- Setup nvim-notify
    notify.setup({
      stages = "fade_in_slide_out", -- Animation style for notifications
      timeout = 2000, -- Time in milliseconds for notifications to disappear
      background_colour = "#282c34", -- Background color for notifications
      fps = 60, -- Animation frames per second
      icons = {
        ERROR = "", -- Error icon
        WARN = "", -- Warning icon
        INFO = "", -- Info icon
        DEBUG = "", -- Debug icon
        TRACE = "✎", -- Trace icon
      },
      minimum_width = 30, -- Minimum width of notification windows
    })

    -- Replace the default `vim.notify` with `nvim-notify`
    vim.notify = notify

    -- Keybinding to access notification history
    vim.keymap.set("n", "<leader>nh", function()
      notify.history()
    end, { desc = "Show notification history" })

    -- Keybinding to dismiss all notifications
    vim.keymap.set("n", "<leader>nd", function()
      notify.dismiss({ silent = true, pending = true })
    end, { desc = "Dismiss all notifications" })
  end,
}
