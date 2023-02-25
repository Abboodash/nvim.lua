local status, notify = pcall(require, "notify")
if (not status) then return end

vim.notify = notify

notify.setup({
  background_colour = "#000000",
})
