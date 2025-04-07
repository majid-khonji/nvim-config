
-- debug business
require("dapui").setup()
local dap = require('dap')
local dap_python = require('dap-python')

dap_python.setup('/usr/bin/python3') -- Adjust the path to your system Python interpreter

dap.configurations.python = {
    {
        type = 'python',
        request = 'launch',
        name = "Launch file",
        program = "${file}",
        pythonPath = function()
            return '/usr/bin/python3' -- Adjust the path to your system Python interpreter
        end,
    },
}
