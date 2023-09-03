vim.g.dotnet_build_project = function()
    local default_path = vim.fn.getcwd() .. '/'
    if vim.g['dotnet_last_proj_path'] ~= nil then
        default_path = vim.g['dotnet_last_proj_path']
    end
    local path = vim.fn.input('Path to your *proj/*sln file', default_path, 'file')
    vim.g['dotnet_last_proj_path'] = path
    local cmd = 'dotnet build -c Debug ' .. path .. ' > /dev/null'
    print('')
    print('Cmd to execute: ' .. cmd)
    local f = os.execute(cmd)
    if f == 0 then
        print('\nBuild: ✔️ ')
    else
        print('\nBuild: ❌ (code: ' .. f .. ')')
    end
end

vim.g.dotnet_get_dll_path = function()
    local request = function()
        -- Presents all Csproj's in the solution and allows user to select which one to run
        -- List directories containing a csproj
        local projects=vim.fn.split(vim.fn.system("find . -type f -name \"*.csproj\" -exec dirname \"{}\" \\; | sed -e 's,^\\./,,'"), "\\n")
        -- Get User input to select the numbered projects
        local annotatedProjects = {}
        for i, name in ipairs(projects) do
         annotatedProjects[i] = i..". "..name
        end
        local selectedProjectIndex = vim.fn.inputlist(annotatedProjects)
        local selectedProject = projects[selectedProjectIndex]
        -- Find Dll for the selected project currently assumes there is a single framework version.
        -- If multiple becomes necessary we'll have to add another selection block to choose what version to run
        local dllPath = vim.fn.system("find ./"..selectedProject.."/bin -type f -name "..selectedProject..".dll")
        --[[ return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file') ]]
        return vim.fn.trim(dllPath)
    end

    if vim.g['dotnet_last_dll_path'] == nil then
        vim.g['dotnet_last_dll_path'] = request()
    else
        if vim.fn.confirm('Do you want to change the path to dll?\n' .. vim.g['dotnet_last_dll_path'], '&yes\n&no', 2) == 1 then
            vim.g['dotnet_last_dll_path'] = request()
        end
    end
    vim.fn.confirm(vim.g['dotnet_last_dll_path'], '&yes\n&no', 2)
    return vim.g['dotnet_last_dll_path']
end


return {
  adaptors = {
    coreclr = {
      type = 'executable',
      command = '/usr/local/bin/netcoredbg/netcoredbg',
      args = {'--interpreter=vscode'}
    }
  },
  configurations = {
    cs = {
      {
        type = "coreclr",
        name = "launch - netcoredbg",
        request = "launch",
        program = function()
          if vim.fn.confirm('Should I recompile first?', '&yes\n&no', 2) == 1 then
              vim.g.dotnet_build_project()
          end
          return vim.g.dotnet_get_dll_path()
        end,
      },
      {
        type = "coreclr",
        name = "launch - Pick Process",
        request = "attach",
        processId = function ()
          if vim.fn.confirm('Should I recompile first?', '&yes\n&no', 2) == 1 then
              vim.g.dotnet_build_project()
          end
          return require('dap.utils').pick_process
        end,
        args={}
      }
    }
  }
}
-- On CLI running "VSTEST_HOST_DEBUG=1 dotnet test &" will start a process that waits for the Debugger to attach and reports the processId
-- May be a way to integrate this command into the launch - Pick Process profile for debugging tests
