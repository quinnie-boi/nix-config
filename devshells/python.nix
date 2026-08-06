{ pkgs }:

pkgs.mkShell {
  packages = [
    (pkgs.python3.withPackages (python-pkgs: [
      python-pkgs.numpy
      python-pkgs.matplotlib
      python-pkgs.ruff
      python-pkgs.sympy
      python-pkgs.scipy
    ]))
    pkgs.ty
  ];
}
