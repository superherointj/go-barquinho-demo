{
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = { self, flake-utils, nixpkgs }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system}; in
      with pkgs;
      rec {
        defaultPackage = packages.barquinho;
        packages = rec {
          barquinho = callPackage ./default.nix {
            entproto = entproto;
          };
          entproto = callPackage ./entproto.nix { };
        };
        devShell = devShells.barquinho;
        devShells = {
          barquinho = callPackage ./shell.nix {
            entproto = packages.entproto;
          };
        };
      }
    );

}
