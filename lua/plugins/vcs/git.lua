return {
  {
    {
      "NeogitOrg/neogit",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "sindrets/diffview.nvim",
        "nvim-telescope/telescope.nvim",
      },
      config = function ()
        local neogit = require('neogit')

        vim.keymap.set("n", "<leader>gs", function ()
          neogit.open({ kind = "auto" })
        end)
      end
    }
  }
}
