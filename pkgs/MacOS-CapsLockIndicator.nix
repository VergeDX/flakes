let
  pkgs = import <nixpkgs> { };
  buildDarwinApps = import ../fn/build-darwin-apps.nix;
in
buildDarwinApps rec {
  name = "MacOS-CapsLockIndicator";
  version = "1.0-1";

  src = pkgs.fetchgit {
    url = "https://github.com/HyDevelop/${name}";
    rev = version;
    sha256 = "sha256-f6Enp2YQg5WQSPuoa99sPY/Cocso8PTsZ2jgLKxoW/A=";
  };
}
