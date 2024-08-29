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
  pattern = {"*/playbooks/*.yml", "*/inventories/*.yml", "*/roles/*.yml"},
  callback = function()
    vim.bo.filetype = "yaml.ansible"
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
