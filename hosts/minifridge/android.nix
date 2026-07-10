{ pkgs, ... }:
{
  users.users.quinnieboi.extraGroups = [
    "kvm"
    "libvirtd"
  ];

  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };

  environment.systemPackages = with pkgs; [
    distrobox
    distroshelf
    android-tools
    libvirt
    jdk
    # android-studio
  ];

}
