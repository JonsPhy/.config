return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    -- Real keymaps
    { "<leader>on", "<cmd>ObsidianNew<CR>", desc = "New Note" },
    { "<leader>oq", "<cmd>ObsidianQuickSwitch<CR>", desc = "Quick Switch" },
    { "<leader>ot", "<cmd>ObsidianToday<CR>", desc = "Daily Note" },
    { "<leader>os", "<cmd>ObsidianSearch<CR>", desc = "Search Notes" },

    -- Group with icon
    {
      "<leader>o",
      desc = "Obsidian",
      icon = {
        icon = "\u{f01c8}", -- Nerd Font icon
        hl = "Title", -- Highlight group
        color = "purple", -- Color category (from preset list)
      },
    },
  },
  opts = {
    workspaces = {
      {
        name = "thesis",
        path = "~/Documents/BachelorThesis/obsidian",
      },
    },
    completion = {
      nvim_cmp = false, -- set to true only if you have nvim-cmp installed
    },
    daily_notes = {
      folder = "Daily Notes",
      date_format = "%Y-%m-%d",
      alias_format = "%B %-d, %Y",
    },
    templates = {
      subdir = "Templates",
      date_format = "%Y-%m-%d",
      time_format = "%H:%M",
    },
  },
}
