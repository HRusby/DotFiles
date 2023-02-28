local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  vim.notify("nvim-treesitter.configs not available")
  return
end

configs.setup {
  ensure_installed = {
    "rust",
    "go",
    "python",
    "c_sharp",
    "bash",
    "c",
    "lua",
    "vim",
    "help",
    "cmake",
    "dockerfile",
    "gitignore",
    "html",
    "javascript",
    "java",
    "jq",
    "json",
    "markdown",
    "sql",
    "vue",
    "typescript"
  }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = { "" }, -- List of parsers to ignore installing
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of languages that will be disabled
    additional_vim_regex_highlighting = true,
  },
  indent = { enable = true, disable = { "yaml" } },
  autopairs = { enable = true },
  rainbow = {
    enable = true,
    extended_mode = true, -- Also highlight non-bracket delimiters e.g. html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, integer
    disable = { "" }, -- List of languages to disable rainbow for
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  }
}
