{ pkgs-unstable, ... }:
{
  services.immich = {
    enable = true;
    package = pkgs-unstable.immich;
    host = "localhost";
    port = 2283;
    mediaLocation = "/srv/immich";
    openFirewall = false;

    user = "immich";
    group = "immich";
  };

  # If you are using Network Manager, you need to explicitly prevent it from managing container interfaces:
  # networking.networkmanager.unmanaged = [ "interface-name:ve-*" ];

  # for hardware accelerated video transcoding using VA-API
  users.users.immich.extraGroups = [
    "video"
    "render"
  ];

  networking.firewall.allowedTCPPorts = [
    443
  ];

  networking.tempAddresses = "disabled";

  services.caddy = {
    enable = true;
    virtualHosts."grey-warbler.hopto.org" = {
      extraConfig = ''
        reverse_proxy localhost:2283
      '';
    };
  };

}
