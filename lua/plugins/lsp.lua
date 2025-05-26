return {
  -- LSP keymaps
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "cdelledonne/vim-cmake",
        config = function()
          vim.g.cmake_build_dir = "build"
          vim.g.cmake_generate_options = "-DCMAKE_EXPORT_COMPILE_COMMANDS=1" -- 关键：确保生成编译数据库
        end,
        ft = { "cpp", "c" }, -- 仅对 C/C++ 文件加载
      },
    },
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- disable a keymap
      keys[#keys + 1] = { "<C-k>", mode = "i", false }
      -- add a keymap
      keys[#keys + 1] = { "<C-j>", mode = { "i", "n" }, "<cmd>lua vim.lsp.buf.signature_help()<cr>" }
    end,
    opts = {
      servers = {
        clangd = {
          capabilities = {
            offsetEncoding = "utf-8",
          },
          cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--header-insertion=never",
            "--query-driver=/usr/bin/g++-11",
            "--fallback-style=google",
            "--enable-config", -- 允许读取.clangd配置文件
            "--completion-style=detailed",
            "--all-scopes-completion",
          },
          init_options = {
            fallbackFlags = {
              "-std=c++20",
              "--gcc-toolchain=/usr",
              "-isystem/usr/include/c++/11",
              "-isystem/usr/include/x86_64-linux-gnu/c++/11",
              "-isystem/usr/lib/gcc/x86_64-linux-gnu/11/include",
              "-isystem/usr/local/include",
              "-isystem/usr/include",
            },
            clangdFileStatus = true,
            usePlaceholders = true,
            completeUnimported = true,
          },
          root_dir = function(fname)
            return require("lspconfig.util").root_pattern("compile_commands.json", "CMakeLists.txt", ".git")(fname)
              or vim.fn.getcwd()
          end,
        },
      },
    },
  },
}
