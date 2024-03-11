{pkgs, ...}: {
  colorschemes.tokyonight = {
    enable = false;
    style = "night";
    transparent = true;
  };
  colorschemes.rose-pine = {
    enable = false;
  };
  colorschemes.kanagawa = {
    enable = false;
    theme = "dragon";
    transparent = false;
  };
  colorschemes.catppuccin = {
    enable = true;
    background = {
      light = "macchiato";
      dark = "mocha";
    };
    flavour = "mocha"; # "latte", "mocha", "frappe", "macchiato" or raw lua code
    disableBold = false;
    disableItalic = false;
    disableUnderline = false;
    transparentBackground = true;
    integrations = {
      cmp = true;
      noice = true;
      notify = true;
      neotree = true;
      harpoon = true;
      gitsigns = true;
      which_key = true;
      illuminate = {
        enabled = true;
      };
      treesitter = true;
      treesitter_context = true;
      telescope.enabled = true;
      indent_blankline.enabled = true;
      mini.enabled = true;
      native_lsp = {
        enabled = true;
        inlay_hints = {
          background = true;
        };
        underlines = {
          errors = ["underline"];
          hints = ["underline"];
          information = ["underline"];
          warnings = ["underline"];
        };
      };
    };
  };
  # highlight = {
  #   GruvboxGreenSign = {
  #     bg = "none";
  #     fg = "#b8bb26";
  #   };
  #   GruvboxRedSign = {
  #     bg = "none";
  #     fg = "#fb4934";
  #   };
  #   GruvboxBlueSign = {
  #     bg = "none";
  #     fg = "#83a598";
  #   };
  #   GruvboxYellowSign = {
  #     bg = "none";
  #     fg = "#fabd2f";
  #   };
  #   GruvboxAquaSign = {
  #     bg = "none";
  #     fg = "#8ec07c";
  #   };
  #   Normal = {
  #     bg = "none";
  #   };
  #   NormalFloat = {
  #     bg = "none";
  #   };
  #   NormalNC = {
  #     bg = "none";
  #   };
  #   WinSeparator = {
  #     bg = "none";
  #   };
  #   WinBar = {
  #     bg = "none";
  #   };
  #   SignColumn = {
  #     bg = "none";
  #   };
  #   StatusLine = {
  #     bg = "none";
  #   };
  #   Pmenu = {
  #     bg = "none";
  #   };
  #   CursorLine = {
  #     bg = "none";
  #   };
  # };
  plugins = {
    notify.enable = true;
    lualine = {
      enable = true;
      iconsEnabled = false;
      globalstatus = true;
      theme = "onedark";
    };
    noice = {
      enable = true;
      presets = {
        bottom_search = true;
      };
      cmdline.format = {
        cmdline = {icon = ">";};
        search_down = {icon = "🔍⌄";};
        search_up = {icon = "🔍⌃";};
        filter = {icon = "$";};
        lua = {icon = "☾";};
        help = {icon = "?";};
      };
      format = {
        level = {
          icons = {
            error = "✖";
            warn = "▼";
            info = "●";
          };
        };
      };
      popupmenu = {
        kindIcons = false;
      };
      extraOptions = {
        inc_rename.cmdline.format.IncRename = {icon = "⟳";};
      };
    };
  };
  extraConfigLua = ''
    -- Noice recommended config
    require("noice").setup({
    lsp = {
    	override = {
    		["vim.lsp.util.convert_input_to_markdown_lines"] = true,
    		["vim.lsp.util.stylize_markdown"] = true,
    		["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
    	},
    },
    })
  '';
  # extraConfigVim = ''
  #   augroup user_colors
  #     autocmd!
  #     autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE
  #   augroup END
  # '';
}
