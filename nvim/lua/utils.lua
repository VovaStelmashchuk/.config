local M = {}

function M.is_macos()
  -- Check the operating system name
  local os_name = io.popen("uname"):read("*l")
  return os_name == "Darwin"
end

return M
