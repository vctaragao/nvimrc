vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeToggle)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>ta", function()
    FindAndCloseTerminalBuffer()
    local command = "<C-w>v<C-w>l :terminal go test ./... <CR>"
    vim.cmd("let @t = '" .. command .. "'")
    return command
end, { expr = true })

vim.keymap.set("n", "<leader>t!", function()
    FindAndCloseTerminalBuffer()
    return vim.fn.getreg("t")
end, { expr = true })

vim.keymap.set("n", "<leader>tp", function()
    FindAndCloseTerminalBuffer()
    local command = "<C-w>v<C-w>l :te go test ./" .. vim.fn.expand('%:h') .. "/<CR>"
    vim.cmd("let @t = '" .. command .. "'")
    return command
end, { expr = true })

vim.keymap.set("n", "<leader>tt", function()
    FindAndCloseTerminalBuffer()
    local command = "<C-w>v<C-w>l :terminal go test ./" .. vim.fn.expand('%:h') .. "/ -run '^<C-r><C-w>$'<CR>"
    vim.cmd("let @t = '" .. command .. "'")
    return command
end, { expr = true })

vim.keymap.set({ "n", "v" }, "<leader>p", "\"_dP")

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])
vim.keymap.set({ "n", "v" }, "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", [["*Y]])

vim.keymap.set({ "n", "v" }, "<leader><C-u>", "\"=system(['node', '../../helpers/uuidV6/index.js'])<CR>p")

vim.keymap.set("n", "<leader>s", [[:s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<leader>S", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<leader><C-w>l", "25<C-w>>")
vim.keymap.set("n", "<leader><C-w>h", "25<C-w><")

vim.keymap.set("n", "<leader>%", "<S-v>$%")
vim.keymap.set("v", "<leader>%", "$%")
vim.keymap.set("n", "<leader>}", "<S-v>}")
vim.keymap.set("n", "<leader>{", "<S-v>{")

function FindAndCloseTerminalBuffer()
    local terminalBuf = vim.fn.execute(":buffers aF")
    if terminalBuf == "" then
        return
    end

    terminalBuf = tonumber(terminalBuf:match("^%s*(%d+)"))
    if terminalBuf ~= -1 then
        vim.api.nvim_buf_delete(terminalBuf, { force = true })
    end
end
