local status_for_pairs, autopairs = pcall(require, "nvim-autopairs")
local status_for_tag, autotag = pcall(require, "nvim-ts-autotag")
if (not status_for_pairs or not status_for_tag) then return end

-- https://github.com/windwp/nvim-autopairs
-- https://github.com/windwp/nvim-ts-autotag

autopairs.setup({ })
autotag.setup({ })
