{...}: {
  plugins = {
    ### This tiny plugin adds vscode-like pictograms to neovim built-in lsp
    lspkind = {
      symbolMap = {
        "Text" = "󰊄";
        "Method" = "󰕳";
        "Function" = "󰊕";
        "Constructor" = "";
        "Field" = "";
        "Variable" = "󰀫";
        "Class" = "󰠱";
        "Interface" = "";
        "Module" = "";
        "Property" = "󰜢";
        "Unit" = "󰑭";
        "Value" = "󰎠";
        "Enum" = "";
        "Keyword" = "󰌋";
        "Snippet" = "";
        "Color" = "󰏘";
        "File" = "󰈙";
        "Reference" = "󰈇";
        "Folder" = "󰉋";
        "EnumMember" = "";
        "Constant" = "󰏿";
        "Struct" = "󰙅";
        "Event" = "";
        "Operator" = "󰆕";
        "TypeParameter" = "";
      };

      cmp = {
        enable = true;
        maxWidth = 50;
        ellipsisChar = "...";
      };
    };
  };
}
