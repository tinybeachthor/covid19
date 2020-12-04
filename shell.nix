{ pkgs ? import <nixpkgs> { } }:

with pkgs;

let
  my-rstudio = rstudioWrapper.override { packages = with rPackages; [
    curl

    tidyverse
    lubridate

    plot3D

    # phase space & chaos
    latex2exp
    nonlinearTseries

    # document output
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
