{ config, pkgs, ... }:
let
  # https://github.com/VanCoding/nix-vscode-extension-manager#installation
  vscode-with-extensions =
    (pkgs.vscode-with-extensions.override {
      vscodeExtensions = pkgs.vscode-utils.extensionsFromVscodeMarketplace
        (builtins.fromJSON (builtins.readFile ./vscode-extensions.json));
    }).overrideAttrs (oldAttrs: rec {
      # https://github.com/nix-community/home-manager/blob/master/modules/programs/vscode.nix#L14
      pname = pkgs.vscode.pname;
    });
in
{
  environment.systemPackages = [
    (import ../pkgs/menubar_runcat.nix)
    (import ../pkgs/MacOS-CapsLockIndicator.nix)

    # vscode | vscode-insiders | vscodium
    vscode-with-extensions
    pkgs.kitty # pkgs.alacritty
  ] ++ import ../fetched_apps.nix;

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
