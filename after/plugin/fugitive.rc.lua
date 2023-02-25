-- local status, fugitive = pcall(require, "fugitive")
-- if (not status) then return end
-- TODO: make this check work 
local status2, wk = pcall(require, "which-key")
if (not status2) then return end

wk.register({
    g = {
        name = "Git",
        s = {"<cmd>Git status<cr>", "Status"},
        a = {"<cmd>Git add .<cr>", "Add All"},
        p = {"<cmd>Git push<cr>", "Push"},
        f = {"<cmd>Git fetch", "Fetch"},
        d = {"<cmd>Git pull", "Pull"},
        l = {"<cmd>Git log<cr>", "Log"}
    }
}, {prefix = "<leader>"})
