local lockfiles = {
  "bun.lock",
  "bun.lockb",
  "package-lock.json",
  "pnpm-lock.yaml",
  "yarn.lock",
}

local function local_tsc(root_dir)
  return vim.fs.joinpath(root_dir, "node_modules", ".bin", "tsc")
end

---@type vim.lsp.Config
return {
  cmd = function(dispatchers, config)
    return vim.lsp.rpc.start({
      local_tsc(assert(config.root_dir)),
      "--lsp",
      "--stdio",
    }, dispatchers)
  end,
  filetypes = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
  },
  root_dir = function(bufnr, on_dir)
    local root_dir = vim.fs.root(bufnr, { lockfiles, { ".git" } })
    if not root_dir then
      return
    end

    local tsc = local_tsc(root_dir)
    if vim.fn.executable(tsc) ~= 1 then
      return
    end

    local result = vim.system({ tsc, "--version" }, { text = true }):wait()
    local major = result.stdout and tonumber(result.stdout:match("(%d+)"))
    if result.code == 0 and major and major >= 7 then
      on_dir(root_dir)
    end
  end,
}
