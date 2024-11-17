{
  description = "A Nix-flake-based Shell development environment";

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
        pkgs = import nixpkgs { inherit system; };
        buildInputs = with pkgs; [
          shellcheck
          shfmt
          just
        ];
      in
      {
        devShells.default = pkgs.mkShell {
          inherit buildInputs;
        };
      }
    );
}
