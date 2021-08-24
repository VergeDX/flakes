{ stdenv, fetchgit }:
stdenv.mkDerivation rec {
  name = "nerdfetch";
  version = "0d86c13";

  src = fetchgit {
    url = "https://github.com/thatonecalculator/nerdfetch";
    rev = "${version}0edf52e863bca235755198f78fd4bf94e";
    sha256 = "sha256-sE9yOOKX8bpJkMWiJgp8mleTZB+t6ambIg7eL1kuyoc=";
  };

  installPhase = "mkdir -p $out/bin/ && cp ./nerdfetch $out/bin/";
}
