local status, hop = pcall(require, "hop")
if (not status) then return end

hop.setup()

local status2, wk = pcall(require, "which-key")
if (not status2) then return end

wk.register({
    s = {
        name = "Hop",
        s = {"<cmd>HopWord<cr>", "Word"},
        l = {"<cmd>HopLine<cr>", "Line"}
    }
}, {prefix = "<leader>"})
