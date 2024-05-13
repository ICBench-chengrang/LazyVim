return {
  -- LSP keymaps
  {
    "neovim/nvim-lspconfig",
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- disable a keymap
      keys[#keys + 1] = { "<C-k>", mode = "i", false }
      -- add a keymap
      keys[#keys + 1] = { "<C-j>", mode = { "i", "n" }, "<cmd>lua vim.lsp.buf.signature_help()<cr>" }
    end,
  },
}
