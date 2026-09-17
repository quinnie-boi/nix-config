{
  pkgs,
  pkgs-unstable,
  ...
}:
{
  imports = [ ../../common/home ];

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
      # Games and Virtualisation
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
      vertical-workspaces # Nicer workspaces overview
      reboottouefi # Adds uefi boot option
      dual-shock-4-battery-percentage # power level in top panel
    ]);

  # These are reset to all disabled unless manually defined.
  # I would much prefer imperative usage but alas.
  dconf.settings = {
    "org/gnome/shell" = {
      enabled-extensions = [
        "blur-my-shell@aunetx"
        "happy-appy-hotkey@jqno.nl"
        "caffeine@patapon.info"
        "middleclickclose@paolo.tranquilli.gmail.com"
        "tiling-assistant@leleat-on-github"
        "monitor-brightness-volume@ailin.nemui"
        "tailscale@joaophi.github.com"
        "gsconnect@andyholmes.github.io"
      ];
    };
  };
}
