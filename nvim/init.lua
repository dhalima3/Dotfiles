vim.g.mapleader = " "
vim.g.maplocalleader = " "

local treesitter_parsers = {
  "bash",
  "css",
  "html",
  "javascript",
  "json",
  "lua",
  "markdown",
  "markdown_inline",
  "python",
  "tsx",
  "typescript",
}

vim.api.nvim_create_autocmd("PackChanged", {
  group = vim.api.nvim_create_augroup("treesitter_pack_update", { clear = true }),
  callback = function(event)
    if event.data.spec.name ~= "nvim-treesitter" then
      return
    end

    if event.data.kind == "install" or event.data.kind == "update" then
      vim.cmd.packadd("nvim-treesitter")
      require("nvim-treesitter").install(treesitter_parsers)
    end
  end,
  desc = "Install Treesitter parsers after plugin changes",
})

vim.pack.add({
  {
    src = "https://github.com/nvim-mini/mini.nvim",
    version = "stable",
  },
  "https://github.com/brianhuster/live-preview.nvim",
  "https://github.com/ibhagwan/fzf-lua",
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/nvim-treesitter/nvim-treesitter",
  "https://github.com/stevearc/conform.nvim",
  {
    src = "https://github.com/catppuccin/nvim",
    name = "catppuccin",
  },
})

require("nvim-treesitter").install(treesitter_parsers)

vim.opt.number = true
vim.opt.wrap = false
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = -1
vim.opt.showmatch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.clipboard = "unnamedplus"
vim.opt.completeopt = { "menuone", "noselect", "popup" }

vim.keymap.set("i", "jj", "<Esc>", { desc = "Exit insert mode" })
vim.keymap.set("n", "<Leader>w", "<Cmd>write<CR>", { desc = "Save file" })
vim.keymap.set("n", "<Esc>", "<Cmd>nohlsearch<CR><Esc>", {
  desc = "Clear search highlighting",
})

require("mini.diff").setup()
require("mini.git").setup()
require("mini.icons").setup()
require("mini.pairs").setup()
require("mini.surround").setup({
  mappings = {
    add = "ys",
    delete = "ds",
    find = "",
    find_left = "",
    highlight = "",
    replace = "cs",
    suffix_last = "",
    suffix_next = "",
  },
  search_method = "cover_or_next",
})
require("mini.trailspace").setup()
require("livepreview.config").set()
require("conform").setup({
  formatters_by_ft = {
    css = { "biome" },
    javascript = { "biome-organize-imports", "biome" },
    javascriptreact = { "biome-organize-imports", "biome" },
    json = { "biome" },
    jsonc = { "biome" },
    python = { "ruff_organize_imports", "ruff_format" },
    typescript = { "biome-organize-imports", "biome" },
    typescriptreact = { "biome-organize-imports", "biome" },
  },
  format_on_save = {
    lsp_format = "fallback",
    timeout_ms = 1000,
  },
})

require("catppuccin").setup({
  flavour = "macchiato",
})
vim.cmd.colorscheme("catppuccin-nvim")

vim.keymap.del("x", "ys")
vim.keymap.set("x", "S", [[:<C-u>lua MiniSurround.add("visual")<CR>]], {
  silent = true,
  desc = "Add surrounding",
})
vim.keymap.set("n", "yss", "ys_", {
  remap = true,
  desc = "Surround line",
})

vim.keymap.set("n", "<Leader>o", function()
  require("fzf-lua").combine({
    pickers = "oldfiles;files",
    cwd_only = true,
    file_icons = "mini",
    git_icons = true,
    include_current_session = true,
    fzf_opts = {
      ["--tiebreak"] = "index",
    },
  })
end, { desc = "Find files (recent first)" })

vim.keymap.set("n", "<Leader>gs", "<Cmd>Git status<CR>", { desc = "Git status" })
vim.keymap.set("n", "<Leader>gd", "<Cmd>Git diff<CR>", { desc = "Git diff" })
vim.keymap.set("n", "<Leader>gc", "<Cmd>Git commit<CR>", { desc = "Git commit" })
vim.keymap.set("n", "<Leader>gl", "<Cmd>Git log<CR>", { desc = "Git log" })
vim.keymap.set("n", "<Leader>gp", "<Cmd>Git push<CR>", { desc = "Git push" })
vim.keymap.set("n", "<Leader>ws", MiniTrailspace.trim, {
  desc = "Trim trailing whitespace",
})

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("core_filetype_settings", { clear = true }),
  pattern = {
    "bash",
    "css",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "jsonc",
    "lua",
    "markdown",
    "python",
    "typescript",
    "typescriptreact",
  },
  callback = function(event)
    pcall(vim.treesitter.start, event.buf)
  end,
  desc = "Enable Treesitter highlighting",
})

vim.api.nvim_create_autocmd("FileType", {
  group = "core_filetype_settings",
  pattern = "markdown",
  callback = function()
    vim.opt_local.spell = true
  end,
  desc = "Enable spell checking for Markdown",
})

vim.api.nvim_create_autocmd("FileType", {
  group = "core_filetype_settings",
  pattern = "python",
  callback = function(event)
    vim.keymap.set("n", "<Leader>r", "<Cmd>!clear; python3 %<CR>", {
      buffer = event.buf,
      desc = "Run current Python file",
    })
  end,
  desc = "Configure Python mappings",
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp_completion", { clear = true }),
  callback = function(event)
    local client = assert(vim.lsp.get_client_by_id(event.data.client_id))

    if client.name == "ruff" then
      client.server_capabilities.hoverProvider = false
    end

    if client:supports_method("textDocument/completion") then
      vim.lsp.completion.enable(true, client.id, event.buf, {
        autotrigger = true,
      })
      vim.keymap.set("i", "<C-Space>", vim.lsp.completion.get, {
        buffer = event.buf,
        desc = "Trigger LSP completion",
      })
    end
  end,
})

vim.lsp.enable({
  "biome",
  "eslint",
  "ruff",
  "tailwindcss",
  "ts_native",
  "ty",
})
