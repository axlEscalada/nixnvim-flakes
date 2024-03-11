{pkgs, ...}: {
  plugins = {
    nvim-cmp = {
      enable = true;
      snippet.expand = "luasnip";
      mapping = {
        "<C-d>" = "cmp.mapping.scroll_docs(-4)";
        "<C-f>" = "cmp.mapping.scroll_docs(4)";
        "<C-e>" = "cmp.mapping.close()";
        "<C-space>" = "cmp.mapping.complete()";
        "<C-y>" = {
          action = "cmp.mapping.confirm({
                                select = true, behavior = cmp.ConfirmBehavior.Insert })";
        };
        "<CR>" = {
          action = "cmp.mapping.confirm({ select = true })";
        };
        "<S-CR>" = {
          action = "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })";
        };
        "<Down>" = {
          modes = ["i" "s"];
          action = ''
             function(fallback)
             	if cmp.visible() then
            		cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
            	luasnip.expand_or_jump()
            else
            fallback()
                 end
            end
          '';
        };
        "<Up>" = {
          modes = ["i" "s"];
          action = ''
             function(fallback)
            	if cmp.visible() then
            		cmp.select_prev_item()
            	elseif luasnip.jumpable(-1) then
            		luasnip.jump(-1)
            	else
            		fallback()
            	end
            end
          '';
        };
      };
      window.documentation.border = [
        "╭"
        "─"
        "╮"
        "│"
        "╯"
        "─"
        "╰"
        "│"
      ];
      sources = [
        {name = "nvim_lua";}
        {name = "nvim_lsp";}
        {name = "cmdline";}
        {name = "path";}
        {name = "luasnip";}
        {name = "buffer";}
      ];
    };
    cmp-buffer.enable = true;
    cmp-nvim-lsp.enable = true;
    cmp-nvim-lua.enable = true;
    cmp-cmdline.enable = true;
    cmp-path.enable = true;
    luasnip.enable = true;
  };
  extraConfigLua = ''
    -- Extra options for cmp-cmdline setup
    local cmp = require("cmp")
    cmp.setup.cmdline(":", {
    	mapping = cmp.mapping.preset.cmdline(),
    	sources = cmp.config.sources({
    		{ name = "path" },
    	}, {
    		{
    			name = "cmdline",
    			option = {
    				ignore_cmds = { "Man", "!" },
    			},
    		},
    	}),
    })
  '';
}
