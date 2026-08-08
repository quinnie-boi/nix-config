{ pkgs }:
pkgs.mkShell {
  buildInputs = [
    pkgs.clang
    pkgs.gnumake
    pkgs.meson
  ];
}
