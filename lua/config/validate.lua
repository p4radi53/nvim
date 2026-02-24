local M = {}

--- Validate Config against a table of known defaults.
--- Returns a list of warning strings for any unknown keys found.
---@param config table The current Config table (potentially modified by local.lua)
---@param defaults table The original defaults table (snapshot taken before local.lua)
---@return string[] warnings
function M.validate(config, defaults)
  local warnings = {}

  for k, _ in pairs(config) do
    if defaults[k] == nil then
      table.insert(warnings, "Config: unknown key '" .. k .. "'")
    end
  end

  if config.languages and type(config.languages) == "table" and defaults.languages then
    for k, _ in pairs(config.languages) do
      if defaults.languages[k] == nil then
        table.insert(warnings, "Config.languages: unknown key '" .. k .. "'")
      end
    end
  end

  return warnings
end

return M
