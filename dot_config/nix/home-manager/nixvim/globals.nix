{...}: {
  programs.nixvim = {
    ### See `:help mapleader`
    globals = {
      mapleader = " ";
      maplocalleader = " ";

      have_nerd_font = true;
    };
  };
}
