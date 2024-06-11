local M = {}

function Compile_run_cpp()
	local src_path = vim.fn.expand('%:p:~')
	local src_noext = vim.fn.expand('%:p:~:r')
	local _flag = '-Wall -Wextra -std=c++17 -DONPC -O2'
	local prog = 'g++'
	vim.cmd('w')
	vim.cmd('vnew')
	vim.cmd('set nonu')
	vim.cmd('set nornu')
	vim.cmd('term ' .. prog .. ' ' .. _flag .. ' ' .. src_path .. ' -o ' .. src_noext .. ' && ' .. src_noext)
	vim.cmd('startinsert')
end

function Compile_run_cpp5()
	local src_path = vim.fn.expand('%:p:~')
	local src_noext = vim.fn.expand('%:p:~:r')
	local inp_file = vim.fn.expand('inp1.txt')
	local _flag = '-Wall -Wextra -Wshadow -std=c++17 -DONPC -O2'
	local prog = 'g++'
	vim.cmd('w')
	vim.cmd('vnew')
	vim.cmd('set nonu')
	vim.cmd('set nornu')
	vim.cmd('term ' .. prog .. ' ' .. _flag .. ' ' .. src_path .. ' -o ' .. src_noext .. ' && ' .. src_noext .. ' < ' .. inp_file)
	vim.cmd('startinsert')
end

M.disabled = {
  n = {
      ["<C-a>"] = "",
  },
}

M.abc = {
  n = {
    ["<C-a>"] = {
      "ggVG",
      "Select all"
    },

    ["<f9>"] = {
      "<cmd> lua Compile_run_cpp()<CR>",
      "Run C++"
    },

    ["<f5>"] = {
      "<cmd> lua Compile_run_cpp5()<CR>",
      "Run C++"
    },
  },
}

return M
