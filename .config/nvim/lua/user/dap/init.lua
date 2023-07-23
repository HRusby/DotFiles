local status_ok,dap  = pcall(require, "dap")
if not status_ok then
	return "DAP is not available"
end

--[[ local dap = require('dap') ]]

--[[ dap.adapters.coreclr = { ]]
--[[   type = 'executable', ]]
--[[   command = '/usr/local/bin/netcoredbg/netcoredbg', ]]
--[[   args = {'--interpreter=vscode'} ]]
--[[ } ]]
--[[]]
--[[ dap.configurations.cs = { ]]
--[[   { ]]
--[[     type = "coreclr", ]]
--[[     name = "launch - netcoredbg", ]]
--[[     request = "launch", ]]
--[[     program = function () ]]
--[[       return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file') ]]
--[[     end ]]
--[[   } ]]
--[[ } ]]

local adapters = {}
local configurations = {}
local servers = { "netcoredbg" }
for _, server in ipairs(servers) do
  local server_opts = require("user/dap/settings/"..server)
  adapters = vim.tbl_deep_extend("force", server_opts.adaptors, adapters)
  configurations = vim.tbl_deep_extend("force", server_opts.configurations, configurations)
  --[[ lspconfig[server].setup(opts) ]]
end

dap.adapters = adapters
dap.configurations = configurations

require 'user/dap/dap-ui'

local status_ok_wk, wk = pcall(require, "which-key")
if not status_ok_wk then
  vim.notify("which-key not available")
  return
end

wk.register({
    ["<F5>"] = {"<Cmd>lua require'dap'.continue()<CR>", "Debug: Continue"},
    ["<F10>"] = {"<Cmd>lua require'dap'.step_over()<CR>", "Debug: Step Over"},
    ["<F11>"] = {"<Cmd>lua require'dap'.step_into()<CR>", "Debug: Step Into"},
    ["<F12>"] = {"<Cmd>lua require'dap'.step_out()<CR>", "Debug: Step Out"},
    ["<leader>"] = {
      b = {"<Cmd>lua require'dap'.toggle_breakpoint()<CR>", "Debug: Toggle Breakpoint"},
      B = {"<Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint Condition: '))<CR>", "Debug: Set Breakpoint"},
      ["lp"] = {"<Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", "Debug: Log Point Message"},
      ["dr"] = {"<Leader>dr <Cmd>lua require'dap'.repl.open()<CR>", "Debug: Open REPL"},
      ["dl"] = {"<Cmd>lua require'dap'.run_last()<CR>", "Debug: Run Last"},
    },
  }, { mode = "n", noremap = true, silent = true})
--[[ nnoremap <silent> <Leader>b <Cmd>lua require'dap'.toggle_breakpoint()<CR> ]]
--[[ nnoremap <silent> <Leader>B <Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR> ]]
--[[ nnoremap <silent> <Leader>lp  ]]
--[[ nnoremap <silent> <Leader>dr <Cmd>lua require'dap'.repl.open()<CR> ]]
--[[ nnoremap <silent> <Leader>dl <Cmd>lua require'dap'.run_last()<CR> ]]
