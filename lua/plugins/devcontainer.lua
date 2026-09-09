return {
  {
    "erichlf/devcontainer-cli.nvim",
    dependencies = { "akinsho/toggleterm.nvim" },
    cmd = "DevcontainerUp",
    keys = {
      { "<leader>Du", "<cmd>DevcontainerUp<cr>", desc = "Devcontainer Up" },
      { "<leader>Dc", "<cmd>DevcontainerConnect<cr>", desc = "Devcontainer Connect" },
      { "<leader>De", "<cmd>DevcontainerExec<cr>", desc = "Devcontainer Exec" },
    },
    opts = {
      shell = "bash",
      nvim_binary = "nvim",
    },
  },
}
