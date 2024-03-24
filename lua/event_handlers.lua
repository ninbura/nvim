local focused_side_file_path = vim.fn.stdpath('config') .. "/focused-side.txt"

local function count_vertical_splits()
    local count = 0
    local windows = vim.api.nvim_list_wins()

    for _, win in ipairs(windows) do
        local width = vim.api.nvim_win_get_width(win)
        if width > 0 then
            count = count + 1
        end
    end

    return count
end

local function create_focused_side_file_if_not_exists()
  if os.rename(focused_side_file_path, focused_side_file_path) == nil then
    local file = io.open(focused_side_file_path, "w")
    if file then
      file:close()
    end
  end
end

local function write_to_focused_side_file(side)
  local file = io.open(focused_side_file_path, "w")

  if file then
    file:write(side)
    file:close()
  end
end

local function determine_focused_side()
  create_focused_side_file_if_not_exists()

  local total_vertical_windows = count_vertical_splits()
  local half_of_total_vertical_windows = math.ceil(total_vertical_windows / 2)
  local current_vertical_window_number = vim.fn.winnr()

  if current_vertical_window_number > half_of_total_vertical_windows then
    write_to_focused_side_file("right")
  else
    write_to_focused_side_file("left")
  end
end

vim.api.nvim_create_autocmd("WinEnter", { callback = function() determine_focused_side() end })
