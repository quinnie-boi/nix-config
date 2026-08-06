{ pkgs }:

pkgs.mkShell {
  packages = [
    (pkgs.python3.withPackages (python-pkgs: [
      python-pkgs.numpy
      python-pkgs.matplotlib
      python-pkgs.sympy
      python-pkgs.pandas
      python-pkgs.ruff
      python-pkgs.scipy
      python-pkgs.tree-sitter-python
      python-pkgs.debugpy
    ]))
    pkgs.ty
  ];
}
