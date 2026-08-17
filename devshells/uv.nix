{ pkgs }:

pkgs.mkShell {
  packages = [
    pkgs.python3
    pkgs.ty
    pkgs.uv
  ];
  env = {
    # Don't create venv using uv
    # UV_NO_SYNC = "1";
    # Prevent uv from managing Python downloads
    UV_PYTHON_DOWNLOADS = "never";
    # Force uv to use nixpkgs Python interpreter
    UV_PYTHON = pkgs.python3.interpreter;
  };
  shellHook = "unset PYTHONPATH";
}
