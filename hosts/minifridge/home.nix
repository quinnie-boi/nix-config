{
  pkgs,
  pkgs-unstable,
  ...
}:
{
  imports = [
    # ../../common/home/hotspot.nix
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
    nix-direnv.enable = true;
    silent = true;
  };

  programs.bash.enable = true;

  services.kanata = {
    enable = true;
    user = "quinnieboi";
  };

  home = {
    username = "quinnieboi";
    homeDirectory = "/home/quinnieboi";
  };

  home.packages =
    (with pkgs-unstable; [
      lutris
      cartridges
      qemu

      # Image editing
      darktable # Photo manager and raw developer
      shotwell # Photo manager
      inkscape # Vector graphics editor
      hugin # Panorama stitcher
    ])
    ++ (with pkgs.gnomeExtensions; [
      # Gnome Extensions
      gsconnect
      vertical-workspaces # Nicer workspaces overview
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
      tailscale-qs
    ]);

  fonts.fontconfig.enable = true;

  # These are reset to all disabled unless manually defined.
  # I would much prefer imperative usage but alas.
  dconf.settings = {
    "org/gnome/shell" = {
      enabled-extensions = [
        "vertical-workspaces@G-dH.github.com"
        "reboottouefi@ubaygd.com"
        "blur-my-shell@aunetx"
        "happy-appy-hotkey@jqno.nl"
        "quick-settings-tweaks@qwreey"
        "caffeine@patapon.info"
        "middleclickclose@paolo.tranquilli.gmail.com"
        "tiling-assistant@leleat-on-github"
        "launch-new-instance@gnome-shell-extensions.gcampax.github.com"
        "monitor-brightness-volume@ailin.nemui"
        "tailscale@joaophi.github.com"
        "gsconnect@andyholmes.github.io"
      ];
    };
  };

  nixpkgs.config.allowUnfree = true;

  # Enable home-manager
  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
