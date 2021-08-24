{ pkgs, ... }:
pkgs.stdenv.mkDerivation rec {
  name = "metro-for-steam";
  version = "4.4";

  src = pkgs.fetchurl {
    url = "https://github.com/minischetti/${name}/archive/refs/tags/v${version}.zip";
    sha256 = "sha256-scj8Xnq9kGQx/0A+XVjNZkd754sohn5BXiaFXIubtoU=";
  };

  nativeBuildInputs = [ pkgs.unzip ];
  installPhase = ''
    # https://unix.stackexchange.com/questions/125385/combined-mkdir-and-cd
    mkdir -p $out/${name}/ && cp -r * "$_"
  '';
}
