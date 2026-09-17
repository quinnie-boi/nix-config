{
  pkgs,
  pkgs-unstable,
  ...
}:
{
  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    nix-direnv.enable = true;
    silent = true;
  };

  programs.bash.enable = true;

  programs.zoxide = {
    enable = true;
    options = ["--cmd cd"]; # replace cd command
  };

  programs.fzf = {
    enable = true;
    enableBashIntegration = true;
  };

  home.packages =
    (with pkgs-unstable; [
      hydrapaper # Gnome utility for multi-screen wallpaper
      zed-editor

      spotify

      # Utilities
      pika-backup # Backup manager
      eyedropper # Colour picker
      apostrophe # Markdown Editor
      rnote # Drawing app
      serigy # Clipboard manager
      impression # Disk image etcher
      ffmpeg # Audio/video cli tools
      ddcutil # Brightness
      pwvucontrol # Disables monitor audio sleep while running
      linux-wifi-hotspot
      flatpak-builder
      gnome-extensions-cli
      neovim
      tree
      zoxide

      # LSPs
      nil
      markdown-oxide

      ungoogled-chromium # occasionally handy
      x2goclient
      discord
      planify

      # fonts
      open-sans
      iosevka
      carlito # google equivalent to MS calibri
      minecraftia # minecraft font
      monocraft # monospace + ligatures minecraft programming font
      maple-mono.opentype
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
      reboottouefi # Adds uefi boot option
      tailscale-qs
    ]);
}
