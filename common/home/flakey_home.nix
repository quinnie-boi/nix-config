{
  self,
  ...
}:
{
  # Opinionated: make flake registry and nix path match flake inputs
  # Makes `nix run nixpkgs#...` run using the nixpkgs from this flake
  # Check out flakey_system.nix for more registry stuff
  nix.registry = {
    my.flake = self;
  };
}
