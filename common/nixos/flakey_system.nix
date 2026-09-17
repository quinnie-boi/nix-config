{
  inputs,
  lib,
  config,
  ...
}:
{
  nix =
    let
      flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
    in
    {
      settings = {
        auto-optimise-store = true;
        experimental-features = "nix-command flakes";
        # Opinionated: disable global registry
        flake-registry = "";
        # Workaround for https://github.com/NixOS/nix/issues/9574
        nix-path = config.nix.nixPath;
      };

      optimise.automatic = true;
      channel.enable = false;

      # Opinionated: make flake registry and nix path match flake inputs
      # Makes `nix run nixpkgs#...` run using the nixpkgs from this flake
      # https://nix.dev/manual/nix/2.34/command-ref/new-cli/nix3-registry.html
      registry = {
        nixpkgs.flake = inputs.nixpkgs;
        nixpkgs-unstable.flake = inputs.nixpkgs-unstable;
        # moved to home-manager so it can be updated without full system rebuild.
        # my.flake = self;
      };
      nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
    };
}
