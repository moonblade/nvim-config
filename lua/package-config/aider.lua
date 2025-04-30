require("nvim_aider").setup({
  -- Command that executes Aider
  aider_cmd = "aider",
  -- Command line arguments passed to aider
  args = {
    "--model azure/gpt-4o",
    "--no-auto-commits",
    "--pretty",
    "--stream",
  },
  -- Theme colors (automatically uses Catppuccin flavor if available)
  theme = {
    user_input_color = "#a6da95",
    tool_output_color = "#8aadf4",
    tool_error_color = "#ed8796",
    tool_warning_color = "#eed49f",
    assistant_output_color = "#c6a0f6",
    completion_menu_color = "#cad3f5",
    completion_menu_bg_color = "#24273a",
    completion_menu_current_color = "#181926",
    completion_menu_current_bg_color = "#f4dbd6",
  },
  -- snacks.picker.layout.Config configuration
  picker_cfg = {
    preset = "vscode",
  },
  -- Other snacks.terminal.Opts options
  config = {
    os = { editPreset = "nvim-remote" },
    gui = { nerdFontsVersion = "3" },
  },
  win = {
    wo = { winbar = "Aider" },
    style = "nvim_aider",
    position = "right",
  },
})

-- Keymaps
vim.keymap.set("n", "<C-y>", "<cmd>Aider toggle<cr>", { desc = "Toggle Aider" })
vim.keymap.set("i", "<C-y>", "<cmd>Aider toggle<cr>", { desc = "Toggle Aider" })
vim.keymap.set("n", "<C-t>", "<cmd>Aider add<cr>", { desc = "Add File" })
vim.keymap.set("n", "<C-i>", "<cmd>Aider drop<cr>", { desc = "Drop File" })
-- vim.keymap.set({ "n", "v" }, "<leader>as", "<cmd>Aider send<cr>", { desc = "Send to Aider" })
-- vim.keymap.set("n", "<leader>ac", "<cmd>Aider command<cr>", { desc = "Aider Commands" })
-- vim.keymap.set("n", "<leader>ab", "<cmd>Aider buffer<cr>", { desc = "Send Buffer" })
-- vim.keymap.set("n", "<leader>ar", "<cmd>Aider add readonly<cr>", { desc = "Add Read-Only" })

-- NvimTree specific keymaps (check 'ft' manually since Packer doesn't do filetype-specific keybinds directly)
vim.api.nvim_create_autocmd("FileType", {
  pattern = "NvimTree",
  callback = function()
    vim.keymap.set("n", "<C-t>", "<cmd>AiderTreeAddFile<cr>", { desc = "Add File from Tree to Aider", buffer = true })
    vim.keymap.set("n", "<C-i>", "<cmd>AiderTreeDropFile<cr>", { desc = "Drop File from Tree from Aider", buffer = true })
  end
})
