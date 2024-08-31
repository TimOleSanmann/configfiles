-- local function open_nvim_tree()
--   -- require("nvim-tree.api").tree.toggle({focus=false})
--   -- vim.cmd("NvimTreeToggle")
--   -- vim.cmd("MinimapRefresh")
-- end
--
-- local function buffEnter()
--   local buffer = vim.api.nvim_buf_get_name(0)
--
--   if string.find(buffer, "NvimTree") then
--     vim.print("Nvim Tree")
--   else
--     if #buffer > 0 then
--       vim.print(buffer)
--     else
--       vim.print("Dashboard")
--     end
--   end
-- end
--
-- vim.api.nvim_create_autocmd({"VimEnter"}, {callback=open_nvim_tree})
--
-- vim.api.nvim_create_autocmd({"BufEnter"}, {callback=buffEnter})
-- \

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "docker-compose.yml", "*docker-compose.*.yml", "*compose*.yml" },
  callback = function()
    vim.bo.filetype = "yaml.docker-compose"
  end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*/playbooks/*.yml", "*/inventories/*.yml", "*/roles/*.yml" },
  callback = function()
    vim.bo.filetype = "yaml.ansible"
  end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*gitlab-ci*.yml" },
  callback = function()
    vim.bo.filetype = "yaml.gitlab"
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = function()
    vim.opt_local.expandtab = false
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
  end,
})

-- Autocommand for highlighting yank
vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
  end,
})

-- Autocommand for write yank to system clipboard
vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.print(vim.fn.has("clipboard"))
    if vim.fn.has("clipboard") == 1 then
      -- Check if command was yank or delete
      if vim.v.event.operator == "y" then
        vim.fn.system("echo -n " .. vim.fn.shellescape(vim.fn.getreg('"')) .. " | pbcopy")
      end
    end
  end,
})
