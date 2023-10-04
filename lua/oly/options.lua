local options =
{
    -- [[ line numbers ]]
    number = true,                      -- Sets line numbers
    relativenumber = true,              -- Sets line numbers to relative
    cursorline = true,                  -- Highlight current line
    scrolloff = 4,                      -- Lines of context
    
    -- [[ indents ]]
    expandtab = true,                   -- Expand tab
    autoindent = true,                  -- Indent lines
    tabstop = 4,                        -- Number of columns occupied by a tabstop
    softtabstop = 4,                    -- Number of columns occupied by a tabstop
    shiftwidth = 4,                     -- Works with tabstop and softtabstop
    
    -- [[ search ]]
    ignorecase = true,                  -- Ignore case in search patterns
    smartcase = true,                   -- Override ignorecase if uppercase is used
    incsearch = true,                   -- Use incremental search
    hlsearch = false,                   -- Highlight search matches
    wildmode = {'longest', 'list'},     -- Gives possible completions
    
    -- [[ Splits ]]
    splitright = true,                  -- Place new window to right of current one
    splitbelow = true,                  -- Place new window below the current one
    
    -- [[ Theme ]]
    syntax = "ON",                      -- Allow syntax highlighting
    termguicolors = true,               -- If term supports ui color then enable
    conceallevel = 0,                   -- so that `` is visible in markdown files
    showtabline = 2,                    -- Always show tabs
}

for k, v in pairs(options) do 
    vim.opt[k] = v
end

vim.cmd('filetype plugin on')           -- Allow filetype plugins
vim.cmd('filetype plugin indent on')    -- Allow autoindenting based on filetype
vim.cmd('syntax on')                    -- Enable syntax highlighting

vim.api.nvim_create_autocmd("FileType", {
    pattern = "java",
    command = "setlocal shiftwidth=2 tabstop=2"
})