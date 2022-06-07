require("nvim-dap-virtual-text").setup()

local whichkey = require("which-key")

local keymap = {
	d = {
		name = "Debug",
		R = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run to Cursor" },
		E = { "<cmd>lua require'dapui'.eval(vim.fn.input '[Expression] > ')<cr>", "Evaluate Input" },
		C = { "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>", "Conditional Breakpoint" },
		U = { "<cmd>lua require'dapui'.toggle()<cr>", "Toggle UI" },
		b = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
		c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
		d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
		e = { "<cmd>lua require'dapui'.eval()<cr>", "Evaluate" },
		g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
		h = { "<cmd>lua require'dap.ui.widgets'.hover()<cr>", "Hover Variables" },
		S = { "<cmd>lua require'dap.ui.widgets'.scopes()<cr>", "Scopes" },
		i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
		o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
		p = { "<cmd>lua require'dap'.pause.toggle()<cr>", "Pause" },
		q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
		r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
		s = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
		t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
		x = { "<cmd>lua require'dap'.terminate()<cr>", "Terminate" },
		u = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
	},
}

whichkey.register(keymap, {
	mode = "n",
	prefix = "<leader>",
	buffer = nil,
	silent = true,
	noremap = true,
	nowait = false,
})

local keymap_v = {
	name = "Debug",
	e = { "<cmd>lua require'dapui'.eval()<cr>", "Evaluate" },
}
whichkey.register(keymap_v, {
	mode = "v",
	prefix = "<leader>",
	buffer = nil,
	silent = true,
	noremap = true,
	nowait = false,
})

local dap, dapui = require("dap"), require("dapui")
dapui.setup({})

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

dap.adapters.go = function(callback, _)
	local stdout = vim.loop.new_pipe(false)
	local handle, pid_or_err
	local port = 38697

	handle, pid_or_err = vim.loop.spawn("dlv", {
		stdio = { nil, stdout },
		args = { "dap", "-l", "127.0.0.1:" .. port },
		detached = true,
	}, function(code)
		stdout:close()
		handle:close()

		print("[delve] Exit Code:", code)
	end)

	assert(handle, "Error running dlv: " .. tostring(pid_or_err))

	stdout:read_start(function(err, chunk)
		assert(not err, err)

		if chunk then
			vim.schedule(function()
				require("dap.repl").append(chunk)
				print("[delve]", chunk)
			end)
		end
	end)

	-- Wait for delve to start
	vim.defer_fn(function()
		callback({ type = "server", host = "127.0.0.1", port = port })
	end, 100)
end

dap.configurations.go = {
	{
		type = "go",
		name = "Debug (from vscode-go)",
		request = "launch",
		showLog = false,
		program = "${file}",
		dlvToolPath = vim.fn.exepath("dlv"), -- Adjust to where delve is installed
	},
	{
		type = "go",
		name = "Debug (No File)",
		request = "launch",
		program = "",
	},
	{
		type = "go",
		name = "Debug",
		request = "launch",
		program = "${file}",
		showLog = true,
		-- console = "externalTerminal",
		-- dlvToolPath = vim.fn.exepath "dlv",
	},
	{
		name = "Test Current File",
		type = "go",
		request = "launch",
		showLog = true,
		mode = "test",
		program = ".",
		dlvToolPath = vim.fn.exepath("dlv"),
	},
	{
		type = "go",
		name = "Run lsif-clang indexer",
		request = "launch",
		showLog = true,
		program = ".",
		args = {
			"--indexer",
			"lsif-clang compile_commands.json",
			"--dir",
			vim.fn.expand("~/sourcegraph/lsif-clang/functionaltest"),
			"--debug",
		},
		dlvToolPath = vim.fn.exepath("dlv"),
	},
	{
		type = "go",
		name = "Run lsif-go-imports in smol_go",
		request = "launch",
		showLog = true,
		program = "./cmd/lsif-go",
		args = {
			"--project-root=/home/tjdevries/sourcegraph/smol_go/",
			"--repository-root=/home/tjdevries/sourcegraph/smol_go/",
			"--module-root=/home/tjdevries/sourcegraph/smol_go/",
			"--repository-remote=github.com/tjdevries/smol_go",
			"--no-animation",
		},
		dlvToolPath = vim.fn.exepath("dlv"),
	},
	{
		type = "go",
		name = "Run lsif-go-imports in sourcegraph",
		request = "launch",
		showLog = true,
		program = "./cmd/lsif-go",
		args = {
			"--project-root=/home/tjdevries/sourcegraph/sourcegraph.git/main",
			"--repository-root=/home/tjdevries/sourcegraph/sourcegraph.git/main",
			"--module-root=/home/tjdevries/sourcegraph/sourcegraph.git/main",
			"--no-animation",
		},
		dlvToolPath = vim.fn.exepath("dlv"),
	},
}
