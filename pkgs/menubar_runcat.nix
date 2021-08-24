{ callPackage, pkgs }:
callPackage ../fn/build-darwin-apps.nix { } rec {
  name = "menubar_runcat";
  version = "3ce266a";

  src = pkgs.fetchgit {
    url = "https://github.com/VergeDX/menubar_runcat.git";
    rev = "${version}7aa1aafdec43a65e4ce45eafc12df7406";
    sha256 = "sha256-Lnl9g12aoHrSY6/FoYf73HvWyh2OyOi0zhBs3S407zo=";
  };

  profile = "Menubar RunCat";
}
