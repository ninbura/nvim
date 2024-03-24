local function determine_focused_side()
  local filename = vim.fn.stdpath('config') .. "/focused-side.txt"

  if os.rename(filename, filename) == nil then
    local file = io.open(filename, "w")
    if file then
      file:close()
    end
  end


  local total_vertical_windows = vim.fn.winnr("$")
  local half_of_total_vertical_windows = total_vertical_windows / 2
  local current_vertical_window_number = vim.fn.winnr()

  if current_vertical_window_number > half_of_total_vertical_windows then
    local file = io.open(filename, "w")
    if file then
      file:write("right")
      file:close()
    end
  else
    local file = io.open(filename, "w")
    if file then
      file:write("left")
      file:close()
    end
  end
end

vim.api.nvim_create_autocmd("WinEnter", { callback = function() determine_focused_side() end })
