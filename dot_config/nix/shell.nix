with (import <nixpkgs> {});
mkShell {
    buildInputs = [
      pkgs.neovim
      pkgs.vim
    ];

    shellHook = ''
      echo "hello foobar"
    '';
}
