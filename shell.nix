{ pkgs ? import <nixpkgs> { } }:

with pkgs;

let
  my-rstudio = rstudioWrapper.override { packages = with rPackages; [
    curl

    ggplot2
    astsa
    tseries
    forecast
    fGarch

    knitr
    rmarkdown
  ]; };
in
mkShell {
  buildInputs = [
    my-rstudio
    pandoc
    texlive.combined.scheme-full
  ];
  shellHook = ''
  '';
}
