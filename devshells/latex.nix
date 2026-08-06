{ pkgs }:

pkgs.mkShell {
  packages = with pkgs; [
    texliveFull # One of the smaller tex packages with latex and should have all the programs needed
    tex-fmt
  ];
}
