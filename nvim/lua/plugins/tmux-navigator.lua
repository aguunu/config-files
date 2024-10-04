return {
  "christoomey/vim-tmux-navigator",
  cmd = {
    "TmuxNavigateLeft",
    "TmuxNavigateDown",
    "TmuxNavigateUp",
    "TmuxNavigateRight",
    "TmuxNavigatePrevious",
  },
  keys = {
    { "<c-s-1>", "<cmd>TmuxNavigateLeft<cr>" },
    { "<c-s-2>", "<cmd>TmuxNavigateDown<cr>" },
    { "<c-s-3>", "<cmd>TmuxNavigateUp<cr>" },
    { "<c-s-4>", "<cmd>TmuxNavigateRight<cr>" },
    { "<c-\\>", "<cmd>TmuxNavigatePrevious<cr>" },
  },
}
