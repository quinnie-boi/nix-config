{
  pkgs,
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
    (with pkgs; [

      bazaar
      zed-editor

      gnome-feeds # RSS Feeds

      # Utilities
      eyedropper # Colour picker
      apostrophe # Markdown Editor
      speedcrunch

      kanata # Keyboard remapping

      tmux
      neovim
      tree
      zoxide

      # useful for the occasional broken website
      ungoogled-chromium
    ])
    ++ (with pkgs.gnomeExtensions; [
      # Gnome Extensions
      reboottouefi # Adds uefi boot option
      happy-appy-hotkey # Assign hotkeys to apps to focus or launch them
      dual-shock-4-battery-percentage # power level in top panel
      blur-my-shell # Blurry shell is a needed ux improvement
      caffeine # Keep PC on
      hide-top-bar
      tactile # Tile windows using a custom grid.
      gtile # another tiling thing
      tiling-assistant # Windows-like tiling
      middle-click-to-close-in-overview # Much better.
      control-monitor-brightness-and-volume-with-ddcutil # Control monitor brightness
      burn-my-windows # Visual swag
      gsconnect
    ]);

  fonts.fontconfig.enable = true;

  nixpkgs.config.allowUnfree = true;

  # Enable home-manager
  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
