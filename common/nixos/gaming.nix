{ pkgs, ... }:
{
  programs = {
    gamescope.enable = true;

    steam = {
      enable = true;
      gamescopeSession.enable = true;
      remotePlay.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
      protontricks.enable = true;
      extest.enable = true;
      extraPackages = with pkgs; [
        gamescope
      ];
    };

    gamemode.enable = true;
  };
  environment.systemPackages = with pkgs; [
    bottles
  ];
}
