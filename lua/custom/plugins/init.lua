-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
-- Iterate through incomplete tasks in telescope
-- You can confirm in your terminal lamw25wmal with:
-- rg "^\s*-\s\[ \]" test-markdown.md
vim.keymap.set('n', '<leader>tt', function()
  require('telescope.builtin').grep_string(require('telescope.themes').get_ivy {
    prompt_title = 'Incomplete Tasks',
    -- search = "- \\[ \\]", -- Fixed search term for tasks
    -- search = "^- \\[ \\]", -- Ensure "- [ ]" is at the beginning of the line
    search = '^\\s*- \\[ \\]', -- also match blank spaces at the beginning
    search_dirs = { vim.fn.getcwd() }, -- Restrict search to the current working directory
    use_regex = true, -- Enable regex for the search term
    initial_mode = 'normal', -- Start in normal mode
    layout_config = {
      preview_width = 0.5, -- Adjust preview width
    },
    additional_args = function()
      return { '--no-ignore' } -- Include files ignored by .gitignore
    end,
  })
end, { desc = '[P]Search for incomplete tasks' })

-- Iterate through completed tasks in telescope lamw25wmal
vim.keymap.set('n', '<leader>tc', function()
  require('telescope.builtin').grep_string(require('telescope.themes').get_ivy {
    prompt_title = 'Completed Tasks',
    -- search = [[- \[x\] `done:]], -- Regex to match the text "`- [x] `done:"
    -- search = "^- \\[x\\] `done:", -- Matches lines starting with "- [x] `done:"
    search = '^\\s*- \\[x\\] `done:', -- also match blank spaces at the beginning
    search_dirs = { vim.fn.getcwd() }, -- Restrict search to the current working directory
    use_regex = true, -- Enable regex for the search term
    initial_mode = 'normal', -- Start in normal mode
    layout_config = {
      preview_width = 0.5, -- Adjust preview width
    },
    additional_args = function()
      return { '--no-ignore' } -- Include files ignored by .gitignore
    end,
  })
end, { desc = '[P]Search for completed tasks' })

return {}
