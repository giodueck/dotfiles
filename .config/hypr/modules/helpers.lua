---Recursively print the table; if the value is not a table, then just print the value.
---@param t any
---@param level? number
local function printTable(t, level)
    level = level or 0
    local output = ""
    if type(t) == "table" then
        -- do not print new line on the level 0
        if level ~= 0 then
            output = output .. "\n"
        end

        output = output .. string.rep("\t", level) .. "{\n"
        level = level + 1

        for key, value in pairs(t) do
            output = output .. string.rep("\t", level) .. string.format("[%s] = ", key)
            output = output .. printTable(value, level)
            output = output .. ",\n"
        end

        level = level - 1
        output = output .. string.rep("\t", level) .. "}"
    else
        output = output .. tostring(t)
    end
    -- print new line on the level 0
    if level == 0 then
        output = output .. "\n"
    end

    return output
end

return {
    printTable = printTable,
}
