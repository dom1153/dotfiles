# To setup a new host (nixos)
1. Take a default.nix from a host
2. Change hostname and home file import to new hostname
2. (Optional) Copy hardware.config, applies to nixos installs only
3. (Optional) add ./mount.nix for other not auto-identified drives
4. Install with `nixos-rebuild switch --flake .#your-hostname`