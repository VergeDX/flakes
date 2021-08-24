{ home, pkgs, ... }:
let
  mrConfig = path: url: repo:
    ''
      [${path}]
      checkout = git clone '${url}' '${repo}'
    '';

  ghMrConfig = owner: repo: (mrConfig "Documents/${repo}"
    "git@github.com:${owner}/${repo}.git"
    repo);
in
{
  home.packages = [
    pkgs.wget
    pkgs.tree
    pkgs.watch
    pkgs.p7zip
    pkgs.dmg2img
    pkgs.tmux
    pkgs.htop
    pkgs.ncdu

    pkgs.nodePackages.pxder
    pkgs.nodePackages.clipboard-cli
    pkgs.yarn2nix
    pkgs.nodePackages.node2nix

    pkgs.nano
    pkgs.nanorc

    pkgs.screenfetch
    pkgs.neofetch
    pkgs.lolcat
    (pkgs.callPackage ../../pkgs/nerdfetch.nix { })

    pkgs.scrcpy
    # pkgs.android-tools

    pkgs.mr
    pkgs.binwalk
    pkgs.jq

    pkgs.texlive.combined.scheme-full
    pkgs.deploy-rs.deploy-rs
  ];

  # https://gist.github.com/JeffreyCA/321f9e704e5561d60f90d9f3a923a0ac
  home.file.".nanorc".text = "include ${pkgs.nanorc}/share/*.nanorc";
  home.file.".mrconfig".text = builtins.concatStringsSep "\n" [
    (ghMrConfig "bouk" "dark-mode-notify")
    (ghMrConfig "NixOS" "nixpkgs")
    (ghMrConfig "VergeDX" "menubar_runcat")
    (ghMrConfig "corpnewt" "ProperTree")
    (ghMrConfig "ppy" "osu")
    (ghMrConfig "VergeDX" "config-nixpkgs")
    (ghMrConfig "Vanilla-s-Lab" "vps-nixos-config")
  ];

  programs.autojump.enable = true;
  programs.autojump.enableFishIntegration = true;
}
