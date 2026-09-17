{
  imports = [
    ./flakey_home.nix
    ./gnome
    ./templates
    ./kanata-service
    ./firefox
    ./packages.nix

    # Terminally stuff
    ./shellAliases.nix
    ./starship.nix
    ./git.nix
  ];

  fonts.fontconfig.enable = true;

  nixpkgs.config.allowUnfree = true;

  # Enable home-manager
  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
