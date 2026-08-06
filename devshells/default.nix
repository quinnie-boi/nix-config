{ pkgs }:

{
  rust = import ./rust.nix { inherit pkgs; };
  python = import ./python.nix { inherit pkgs; };
  typst = import ./typst.nix { inherit pkgs; };
  uv = import ./uv.nix { inherit pkgs; };
  r = import ./r.nix { inherit pkgs; };
  latex = import ./latex.nix { inherit pkgs; };
}
