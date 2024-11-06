{
  description = "A flake for installing flux and related tools";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { 
    self, 
    nixpkgs, 
    flake-utils,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (system:
      let 
        # pkgs = import (builtins.fetchTarball {
        #   # flux v2.2.2
        #   url = "https://github.com/NixOS/nixpkgs/archive/7a339d87931bba829f68e94621536cad9132971a.tar.gz";
        #   sha256 = "JMPlh3WoVVOSFSGdetBDKKkKkLNwnTqewFn+g1v2n/A=";
        # }) { inherit system; };
        pkgs = import nixpkgs { inherit system; };
        buildInputs = with pkgs; [
          fluxcd
          kustomize
          kubectl
          kubectx
          k9s
          k3d
          just
          yq-go
          kubeconform
        ];
      in
      {
        devShells.default = pkgs.mkShell {
          inherit buildInputs;
        };
      }
    );
}
