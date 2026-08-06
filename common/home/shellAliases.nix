{
  home.shellAliases = {
    hs = "home-manager switch --flake \".#$USER@$HOSTNAME\"";
    ns = "sudo nixos-rebuild switch --flake \".#$HOSTNAME\"";
    hotspot = "nmcli r wifi off && rfkill unblock wlan && sudo create_ap --daemon wlp13s0 enp14s0 'Minifridge' 'ColdBeers'";
    # Registry would pin the version of these to the last system/home-manager rebuild
    # by linking directly to the flake, I don't have to rebuild to add or modify
    # the development environments. It's more imperative, but the comprimise is the point.
    devpython = "nix develop ~/nix-config#python";
    devuv = "nix develop ~/nix-config#uv";
    devr = "nix develop ~/nix-config#r";
    devtypst = "nix develop ~/nix-config#typst";
    devlatex = "nix develop ~/nix-config#latex";
    devrust = "nix develop ~/nix-config#rust";
  };
}
