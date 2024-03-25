local focused_position_file_path = vim.fn.stdpath('config') .. "/config/focused-position.txt"
local specified_fraction_file_path = vim.fn.stdpath('config') .. "/config/specified-fraction.txt"
local default_fraction = 30

function Write_To_Focused_Position_File(side)
  local file = io.open(focused_position_file_path, "w")

  if file then
    file:write(side)
    file:close()
 end
end

local function create_focused_position_file_if_not_exists()
  if os.rename(focused_position_file_path, focused_position_file_path) == nil then
    Write_To_Focused_Position_File("left")
  end
end

local function create_specified_fraction_file_if_not_exists()
    if os.rename(specified_fraction_file_path, specified_fraction_file_path) == nil then
    local file = io.open(specified_fraction_file_path, "w")
    if file then
      file:write(default_fraction)
      file:close()
    end
  end
end

local function get_specified_fraction()
    create_specified_fraction_file_if_not_exists()
    local file = io.open(specified_fraction_file_path, "r")
    local fraction = default_fraction

    if file then
        fraction = file:read("*n")
        file:close()
    end

    return fraction / 100
end

local function get_focused_position()
    local curr_win = vim.api.nvim_get_current_win()
    local curr_win_info = vim.fn.getwininfo(curr_win)[1]
    local total_width = vim.o.columns
    local win_width = curr_win_info.width
    local left_space = 0
    local max_width_per_column = {}

    for _, win in ipairs(vim.api.nvim_list_wins()) do
        local info = vim.fn.getwininfo(win)[1]
        if info.wincol + info.width <= curr_win_info.wincol then
            if not max_width_per_column[info.wincol] or info.width > max_width_per_column[info.wincol] then
                max_width_per_column[info.wincol] = info.width
            end
        end
    end

    for _, width in pairs(max_width_per_column) do
        left_space = left_space + width
    end

    local right_space = total_width - (left_space + win_width)
    local specified_fraction = get_specified_fraction()
    local specified_fraction_of_total_width = math.floor(total_width * specified_fraction)

    -- print ("left_space: " .. left_space .. ", right_space: " .. right_space .. ", specified_fraction_of_total_width: " .. specified_fraction_of_total_width)

    if specified_fraction < 45 and left_space > specified_fraction_of_total_width and right_space > specified_fraction_of_total_width then
        return "center"
    elseif right_space > specified_fraction_of_total_width or left_space < specified_fraction_of_total_width then
        return "left"
    else
        return "right"
    end
end

local function handle_win_enter()
  local win = vim.api.nvim_get_current_win()
  local buf = vim.api.nvim_win_get_buf(win)
  local filetype = vim.bo[buf].filetype
  local bufname = vim.api.nvim_buf_get_name(buf)

  if filetype == "" and bufname == "" then
    return
  end

  local focused_side = get_focused_position()
  Write_To_Focused_Position_File(focused_side)
end

create_focused_position_file_if_not_exists()
create_specified_fraction_file_if_not_exists()
Write_To_Focused_Position_File("left")

vim.api.nvim_create_autocmd("WinEnter", { callback = function() handle_win_enter() end })
vim.api.nvim_create_autocmd("CmdLineEnter", { callback = function() Write_To_Focused_Position_File("left") end })
vim.api.nvim_create_autocmd("VimLeavePre", { callback = function() Write_To_Focused_Position_File("left") end })
