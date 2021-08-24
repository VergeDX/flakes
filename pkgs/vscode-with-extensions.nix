{ vscode-with-extensions, vscode-utils, vscode }:
# https://github.com/VanCoding/nix-vscode-extension-manager#installation
(vscode-with-extensions.override {
  vscodeExtensions = vscode-utils.extensionsFromVscodeMarketplace
    (builtins.fromJSON (builtins.readFile ../config/vscode-extensions.json));
}).overrideAttrs (oldAttrs: rec {
  # https://github.com/nix-community/home-manager/blob/master/modules/programs/vscode.nix#L14
  pname = vscode.pname;
})
