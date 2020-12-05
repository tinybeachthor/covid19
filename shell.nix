{ pkgs ? import <nixpkgs> { } }:

with pkgs;

let
  my-rstudio = rstudioWrapper.override { packages = with rPackages; [
    curl

    tidyverse
    lubridate

    # timeseries
    zoo
    forecast
    dsa

    # phase space & chaos
    nonlinearTseries

    # fancy plots
    plot3D
    gganimate
    magick

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
