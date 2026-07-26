vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.number = true
vim.opt.wrap = false
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
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

-- todo: if not used, remove
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("core_filetype_settings", { clear = true }),
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
  group = vim.api.nvim_create_augroup("python_lsp_completion", { clear = true }),
  callback = function(event)
    local client = assert(vim.lsp.get_client_by_id(event.data.client_id))
    if client == nil then
      return
    end
    if client.name == "ruff" then
      client.server_capabilities.hoverProvider = false
    end

    if client:supports_method("textDocument/completion") then
      vim.lsp.completion.enable(true, client.id, event.buf, {
        autotrigger = true,
      })
    end
  end,
})

vim.lsp.enable({ "ty", "ruff" })
