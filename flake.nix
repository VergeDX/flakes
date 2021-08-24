{
  inputs = {
    # https://github.com/LnL7/nix-darwin#flakes-experimental
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    darwin.url = "github:lnl7/nix-darwin/master";
    darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    rust-overlay.url = "github:oxalica/rust-overlay";
    # https://github.com/NickCao/flakes/blob/master/flake.nix
    deploy-rs.url = "github:serokell/deploy-rs";
    deploy-rs.inputs.nixpkgs.follows = "nixpkgs";
    # https://github.com/VanCoding/nix-vscode-extension-manager
    nvem.url = "github:vancoding/nix-vscode-extension-manager";
  };

  outputs = { self, darwin, nixpkgs, home-manager, rust-overlay, deploy-rs, nvem, ... }: {
    darwinConfigurations."bogon" = darwin.lib.darwinSystem {
      modules = [ ./top-level/darwin-configuration.nix ];
    };

    homeConfigurations."vanilla" =
      home-manager.lib.homeManagerConfiguration rec {
        username = "vanilla";
        homeDirectory = "/Users/vanilla";

        system = "x86_64-darwin";
        configuration = { pkgs, ... }: {
          imports = [ ./top-level/home-darwin.nix ];
          nixpkgs.overlays = [
            rust-overlay.overlay
            deploy-rs.overlay
          ];

          home.packages = [
            # https://github.com/SCP-2000/infrastructure/blob/master/nixos/hel0/default.nix#L10
            nvem.packages.${system}.nvem
          ];
        };
      };
  };
}
