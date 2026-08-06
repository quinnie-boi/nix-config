{ pkgs }:

pkgs.mkShell {
  packages = with pkgs; [
    R
    rstudio
    rPackages.knitr
    rPackages.tidyverse
    rPackages.rmarkdown
    texliveFull # One of the smaller tex packages with latex and should have all the programs needed
  ];
}
