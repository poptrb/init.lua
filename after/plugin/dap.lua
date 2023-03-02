local present_dapui, dapui = pcall(require, "dapui")
local present_dap, dap = pcall(require, "dap")
local present_virtual_text, dap_vt = pcall(require, "nvim-dap-virtual-text")
local _, shade = pcall(require, "shade")

if not present_dapui or not present_dap or not present_virtual_text then
	return
end

dap_vt.setup({
	enabled = true, -- enable this plugin (the default)
	enabled_commands = true, -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
	highlight_changed_variables = true, -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
	highlight_new_as_changed = false, -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
	show_stop_reason = true, -- show stop reason when stopped for exceptions
	commented = false, -- prefix virtual text with comment string
	only_first_definition = true, -- only show virtual text at first definition (if there are multiple)
	all_references = false, -- show virtual text on all all references of the variable (not only definitions)
	filter_references_pattern = "<module", -- filter references (not definitions) pattern when all_references is activated (Lua gmatch pattern, default filters out Python modules)
})

-- Automatically open UI
dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
	shade.toggle()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
	shade.toggle()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
	shade.toggle()
end

