{ config, pkgs, ... }:
{
  environment.systemPackages = [
    (pkgs.callPackage ../pkgs/menubar_runcat.nix { })
    (pkgs.callPackage ../pkgs/MacOS-CapsLockIndicator.nix { })

    # vscode | vscode-insiders | vscodium
    (pkgs.callPackage ../pkgs/vscode-with-extensions.nix { })
    pkgs.kitty # pkgs.alacritty
  ] ++ pkgs.callPackage ./fetched_apps.nix { };

  programs.fish.enable = true;
  environment.systemPath = [
    "/Users/vanilla/Android/sdk/platform-tools"
  ];

  # https://nixos.wiki/wiki/Flakes
  nix.package = pkgs.nixFlakes;
  nix.extraOptions = "experimental-features = nix-command flakes";

  system.stateVersion = 4;
  services.nix-daemon.enable = true;

  fonts.enableFontDir = true;
  fonts.fonts = [
    pkgs.nerdfonts
    pkgs.powerline-fonts
    pkgs.powerline-symbols
  ] ++ [ pkgs.wineWowPackages.fonts ];

  # Package ‘vscode’ has an unfree license (‘unfree’), refusing to evaluate.
  nixpkgs.config.allowUnfree = true;

  imports = [
    ../patch/3_proxy_variables.nix
    ../patch/applications_fix.nix
  ];
}
