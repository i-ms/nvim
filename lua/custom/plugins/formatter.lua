return {
    "mhartington/formatter.nvim",
    event = "VeryLazy",
    opts = function()
      require("formatter").setup{
        filetype = {
          javascript = {
            require("formatter.filetypes.javascript").prettier
          },
          typescript = {
            require("formatter.filetypes.typescript").prettier
          },
          ["*"] = {
            require("formatter.filetypes.any").remove_trailing_whitespace
          }
        }
      }

      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        command = "FormatWriteLock"
      })
    end
  }