{
  pkgs,
  pkgs-unstable,
  ...
}:
{
  # You can import other home-manager modules here
  imports = [
    ../../common/home/flakey_home.nix
    ../../common/home/gnome
    ../../common/home/templates
    ../../common/home/kanata-service
    ../../common/home/firefox

    # Terminally stuff
    ../../common/home/shellAliases.nix
    ../../common/home/starship.nix
    ../../common/home/git.nix
  ];

  programs.direnv = {
      enable = true;
      enableBashIntegration = true;
      # enables caching n stuff. checkout their gh for info
      nix-direnv.enable = true;
      silent = true;
    };

  programs.zoxide = {
    enable = true;
    options = ["--cmd cd"]; # replace cd command
  };

  programs.fzf = {
    enable = true;
    enableBashIntegration = true;
  };

  programs.bash.enable = true;

  # accessed via home-manager modules
  services.kanata = {
    enable = true;
    user = "busyboy";
  };

  home = {
    username = "busyboy";
    homeDirectory = "/home/busyboy";
  };

  home.packages =
    (with pkgs-unstable; [
      ungoogled-chromium # handy occasionally
      zed-editor

      gnome-feeds # RSS Feeds

      # Utilities
      eyedropper # Colour picker
      apostrophe # Markdown Editor
      kanata # Keyboard remapping
      serigy # clipboard manager

      neovim
      tree
      zoxide

      speedcrunch
    ])
    ++ (with pkgs.gnomeExtensions; [
      # Gnome Extensions
      happy-appy-hotkey # Assign app hotkeys
      blur-my-shell # UX improvement
      caffeine # Keep screen awake
      hide-top-bar
      tiling-assistant # Improved tiling keybinds
      middle-click-to-close-in-overview # minor UX improvement
      control-monitor-brightness-and-volume-with-ddcutil # Control external monitor brightness
      burn-my-windows # Visual swag
      gsconnect # Phone sync
    ]);

  fonts.fontconfig.enable = true;

  # nixpkgs.config.allowUnfree = true;

  # Enable home-manager
  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
