-- PYTHON SPECIFIC SETTINGS

-- Use CodeRun to run the python file
-- This is better than just ":!python '%'" because it will run asynchronously
-- This also seems to be better than asyncrun.vim because it doesn't mess up the cwd
-- -u flag is for unbuffered output (print shows where the output is)
vim.keymap.set("n", "<localleader>", ":RunCode<cr>", { desc = "Run file", buffer = true })
