{
  inputs = {
    # https://github.com/LnL7/nix-darwin#flakes-experimental
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    darwin.url = "github:lnl7/nix-darwin/master";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, darwin, nixpkgs }: {
    darwinConfigurations."bogon" = darwin.lib.darwinSystem {
      modules = [ ./config/darwin-configuration.nix ];
    };
  };
}
