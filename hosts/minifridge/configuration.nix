# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{
  inputs,
  config,
  pkgs,
  ...
}:
{
  # You can import other NixOS modules here
  imports = [
    # Import your generated (nixos-generate-config) hardware configuration
    ./hardware-configuration.nix
    ../../common/nixos/firefox.nix
    # ../../common/nixos/locale.nix
    # ../../common/nixos/ssh.nix
    ../../common/nixos/gnome
    ../../common/nixos/gaming.nix
    ../../common/nixos/flakey_system.nix

    ./hotspot.nix
    ./immich.nix
    ./android.nix

    # modules from nixos-hardware repo:
    inputs.hardware.nixosModules.common-gpu-amd
    inputs.hardware.nixosModules.common-cpu-amd
    inputs.hardware.nixosModules.common-pc-ssd
  ];

  # "Missing GStreamer plugins" for mp4 properties in nautilus
  nixpkgs.overlays = [
    (final: prev: {
      nautilus = prev.nautilus.overrideAttrs (nprev: {
        buildInputs =
          nprev.buildInputs
          ++ (with pkgs.gst_all_1; [
            gst-plugins-good
            gst-plugins-bad
            gst-plugins-rs
          ]);
      });
    })
  ];
  # Get HEIC thumbnails in nautilus, I also added 2 pkgs to system.
  environment.pathsToLink = [ "share/thumbnailers" ];

  # Enable the GNOME Desktop Environment.
  gnome.enable = true;

  # enable virtualisation hypervisor for gnome boxes in hm
  virtualisation.libvirtd.enable = true;
  # programs.virt-manager.enable = true;
  programs.nix-ld.enable = true; # Run unpatched binaries

  # Enable CUPS to print documents using the IPP Everywhere protocol
  services.printing.enable = true;
  services.avahi = {
    enable = true;
    openFirewall = true;
  };

  networking.firewall.enable = true;
  services.openssh = {
    enable = true;
    settings = {
      # Opinionated: forbid root login through SSH.
      PermitRootLogin = "no";
      # Opinionated: use keys only.
      # Remove if you want to SSH using passwords
      PasswordAuthentication = false;
    };
  };

  services.tailscale = {
    enable = true;
    useRoutingFeatures = "server";
  };

  services.ddccontrol.enable = true;

  users.users = {
    quinnieboi = {
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "networkmanager"
        "i2c"
        "uinput"
        "input"
      ];
    };
  };

  fonts.packages = with pkgs.nerd-fonts; [
    _0xproto
    hack
    jetbrains-mono
    iosevka
    fira-code
  ];

  hardware = {
    i2c.enable = true;
    uinput.enable = true;
    graphics.enable = true;
    opentabletdriver.enable = true;
    xpadneo.enable = true; # Advanced Xbox One Driver
  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    # Enable experimental features to see battery level of connected devices.
    settings.General = {
      Experimental = true;
      FastConnectable = true;
    };
  };

  # enable flatpak configuration, apps are installed declaratively in homemanager using module
  services.flatpak.enable = true;

  networking = {
    hostName = "minifridge";
    networkmanager.enable = true;
  };

  environment.systemPackages = with pkgs; [
    libheif
    libheif.out # get HEIC thumbnails in Nautilus
    wget
    vim
    git
    nixd
  ];

  nixpkgs.config.allowUnfree = true;

  # Bootloader configuration
  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;

    kernelModules = [
      "i2c-dev"
      "ddcci_backlight"
      "kvm-amd"
    ];
    extraModulePackages = with config.boot.kernelPackages; [ ddcci-driver ];

    kernelParams = [
      "quiet"
      "splash"
      "loglevel=3"
      "boot.shell_on_fail"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
    ];

    # Enable "Silent Boot"
    consoleLogLevel = 0;
    initrd.verbose = false;
    # Hide OS choice for bootloaders - still accessible via key press
    loader.timeout = 0;

    plymouth = {
      enable = true;
      theme = "colorful_sliced";
      themePackages = with pkgs; [
        # By default we would install all themes
        (adi1090x-plymouth-themes.override {
          selected_themes = [ "colorful_sliced" ];
        })
      ];
    };
  };

  # Set your time zone.
  time.timeZone = "Pacific/Auckland";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_NZ.UTF-8";
    LC_IDENTIFICATION = "en_NZ.UTF-8";
    LC_MEASUREMENT = "en_NZ.UTF-8";
    LC_MONETARY = "en_NZ.UTF-8";
    LC_NAME = "en_NZ.UTF-8";
    LC_NUMERIC = "en_NZ.UTF-8";
    LC_PAPER = "en_NZ.UTF-8";
    LC_TELEPHONE = "en_NZ.UTF-8";
    LC_TIME = "en_NZ.UTF-8";
  };

  system.stateVersion = "24.05";
}
