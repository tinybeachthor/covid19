{ pkgs ? import <nixpkgs> { } }:

with pkgs;

let
  my-rstudio = rstudioWrapper.override { packages = with rPackages; [
    curl

    # get data
    lubridate
    tidyverse

    # phase space & chaos
    latex2exp
    nonlinearTseries

    # plot
    ggplot2
    plot3D

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
