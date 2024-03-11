{pkgs, ...}: {
  plugins.telescope = {
    enable = true;
    keymaps = {
      "<leader>?" = {
        action = "oldfiles";
        desc = "[?] Find recently opened files";
      };
      "<leader><space>" = {
        action = "buffers";
        desc = "[ ] Find existing buffers";
      };
      "<leader>/" = {
        action = "current_buffer_fuzzy_find";
        desc = "[/] Fuzzily search in current buffer]";
      };
      ";f" = {
        action = "find_files";
        desc = "[s]earch [f]iles";
      };
      ";h" = {
        action = "help_tags";
        desc = "[s]earch [h]elp";
      };
      ";sw" = {
        action = "grep_string";
        desc = "[s]earch current [w]ord";
      };
      ";c" = {
        action = "live_grep";
        desc = "[s]earch by [g]rep";
      };
      ";sd" = {
        action = "diagnostics";
        desc = "[s]earch [d]iagnotics";
      };
      ";sk" = {
        action = "keymaps";
        desc = "[s]earch [k]eymaps";
      };
    };
  };
}
