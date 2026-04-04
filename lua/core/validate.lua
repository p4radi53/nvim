local M = {}

---@param config table The current Config table (potentially modified by local.lua)
---@param defaults table The original defaults table (snapshot taken before local.lua)
---@return string[] warnings
function M.validate(config, defaults)
	local warnings = {}

	for k in pairs(config) do
		if defaults[k] == nil then
			table.insert(warnings, "Config: unknown key '" .. k .. "'")
		end
	end

	if type(config.languages) == "table" and type(defaults.languages) == "table" then
		for k in pairs(config.languages) do
			if defaults.languages[k] == nil then
				table.insert(warnings, "Config.languages: unknown key '" .. k .. "'")
			end
		end
	end

	return warnings
end

return M
