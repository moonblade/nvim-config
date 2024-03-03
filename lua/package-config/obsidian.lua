require("obsidian").setup({
  workspaces = {
    {
      name = "personal",
      path = "/Users/moonblade/Library/Mobile Documents/iCloud~md~obsidian/Documents/obsidian",
    },
  },
  notes_subdir = "workdir",
  daily_notes = {
    -- Optional, if you keep daily notes in a separate directory.
    folder = "Dairy",
    -- Optional, if you want to change the date format for the ID of daily notes.
    date_format = "%Y-%m-%d",
    -- Optional, if you want to change the date format of the default alias of daily notes.
    alias_format = "%B %-d, %Y",
    -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
    template = "dailyNote"
  },
  templates = {
    subdir = "Template",
    date_format = "%Y-%m-%d",
    time_format = "%H:%M",
    -- A map for custom variables, the key should be the variable and the value a function
    substitutions = {},
  },
  picker = {
    name = "telescope.nvim",
    mappings = {
      new = "<C-x>",
      insert_link = "<C-l>",
    },
  },
})
vim.o.conceallevel = 1
