local map = require("package-config.utils").map
require('avante').setup({
  provider = "copilot",
  cursor_applying_provider = nil,
  copilot = {
    endpoint = "https://api.githubcopilot.com",
    model = "gpt-4o-2024-08-06",
    proxy = nil, -- [protocol://]host[:port] Use this proxy
    allow_insecure = false, -- Allow insecure server connections
    timeout = 30000, -- Timeout in milliseconds
    temperature = 0,
    max_tokens = 4096,
  },
  azure = {
    endpoint = "https://cvazureaice.openai.azure.com",
    api_version = "2024-08-06",
    deployment = "gpt-4o",
    timeout = 30000,
    temperature = 0,
    max_tokens = 4096,
  },
  vertex = {
    endpoint = "https://us-central-1-aiplatform.googleapis.com/v1/projects/loganalysis-432505/locations/us-central-1/publishers/google/models",
    model = "gemini-1.5-flash-002",
    timeout = 30000,
    temperature = 0,
    max_tokens = 4096,
  },
  behaviour = {
    auto_suggestions = false,
  },
})

map("i", "<C-y>", "<cmd>AvanteToggle<CR>")
map("n", "<C-y>", "<cmd>AvanteToggle<CR>")
