{ config, pkgs, ... }:

{
  ### run with home-manager switch
  home.username = "archoo";
  home.homeDirectory = "/home/archoo";

  home.stateVersion = "24.11"; # Please read the documentation before changing.

  home.packages = with pkgs; [
	bat
	delta
	eza
	fd
	fzf
	grc
	ripgrep
	unzip
	zip
	zoxide
	file
	gh
	

	yazi
	chezmoi
	nh
	speedtest-cli
	watchexec
	alejandra
	atuin
	xh
	kondo
	difftastic
	mprocs

	fastfetch
	starship
	entr
	mosh
	gum

	helix
	lazygit
	yazi
	lf
	navi
	ncdu
	tmux
	zellij
	lazydocker
	television
	lazyjournal

	neovim
	fish ### chezmoi
	diff-so-fancy ### chezmoi
  ];

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/archoo/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
