return {
  adaptors = {
    coreclr = {
      type = 'executable',
      command = '/usr/local/bin/netcoredbg/netcoredbg',
      args = {'--interpreter=vscode'}
    }
  },
  configurations = {
    cs = {{
      type = "coreclr",
      name = "launch - netcoredbg",
      request = "launch",
      program = function ()
        return vim.fn.input('Path to dll: ', vim.fn.getcwd() .. '/bin/Debug/', 'file')
      end
    }}
  }
}
