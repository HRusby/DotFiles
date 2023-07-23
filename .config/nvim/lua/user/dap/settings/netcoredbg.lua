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
        -- Build from the CWD, assumes CWD contains a .sln
        print("Building from "..vim.fn.getcwd())
        vim.fn.system("dotnet build")
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
        return vim.fn.trim(dllPath)
      end
    }}
  }
}
