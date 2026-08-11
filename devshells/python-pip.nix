# Python pip environment that uses
# pip + python to handle the toolchain.
# Can be either imperative or declarative (requirements.txt)
# Makes using python with nixos on the fly much more flexible
# All credit to MordragT's template at
# https://github.com/MordragT/nix-templates/blob/master/python-venv/flake.nix

{ pkgs }:
pkgs.mkShell {
  name = "python-pip";
  venvDir = "./.venv";
  buildInputs = with pkgs.python3Packages; [
    # A Python interpreter including the 'venv' module is required to bootstrap
    # the environment.
    python

    # This executes some shell code to initialize a venv in $venvDir before
    # dropping into the shell
    venvShellHook

    # Those are dependencies that we would like to use from nixpkgs, which will
    # add them to PYTHONPATH and thus make them accessible from within the venv.
    #
    # These cannot be uninstalled from the python venv using pip.
    numpy
    matplotlib
    debugpy
  ];

  # Run this command, only after creating the virtual environment
  postVenvCreation = ''
    unset SOURCE_DATE_EPOCH

    pip install -r requirements.txt
  '';

  # Now we can execute any commands within the virtual environment.
  # This is optional and can be left out to run pip manually.
  postShellHook = ''
    # allow pip to install wheels
    unset SOURCE_DATE_EPOCH
  '';
}