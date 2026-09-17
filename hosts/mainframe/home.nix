{
  imports = [ ../../common/home ];

  # created via my own module
  services.kanata = {
    enable = true;
    user = "busyboy";
  };

  home = {
    username = "busyboy";
    homeDirectory = "/home/busyboy";
  };
}
