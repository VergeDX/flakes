{ stdenv, name, version, src, profile ? name }:
stdenv.mkDerivation rec {
  inherit name version src;

  # https://github.com/NixOS/nixpkgs/blob/nixpkgs-unstable/pkgs/applications/terminal-emulators/iterm2/default.nix
  preConfigure = "LD=$CC";
  # https://github.com/gnachman/iTerm2/blob/master/Makefile
  buildPhase = "/usr/bin/xcodebuild -scheme \"${profile}\" -derivedDataPath .";
  installPhase = ''
    mkdir -p $out/Applications/
    find . | grep "\.app$" | xargs -I {} cp -r {} $out/Applications/
  '';
}
