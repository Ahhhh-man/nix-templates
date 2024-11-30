{
  description = "Rust development environment";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";

    rust-overlay.url = "github:oxalica/rust-overlay";
    rust-overlay.inputs.flake-utils.follows = "flake-utils";
    rust-overlay.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, flake-utils, nixpkgs, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;

          overlays = [
            (import inputs.rust-overlay)
          ];
        };

        sharedInputs = with pkgs;
          [
            # cargo-deny
            cargo-edit
            cargo-expand
            cargo-udeps
            cargo-whatfeatures
            clang
            lld
            openssl.dev
            pkg-config
            zlib.dev
            git-cliff
            just
          ];

        rustTools = pkgs.rust-bin.fromRustupToolchainFile ./rust-toolchain.toml;
      in {
        devShells.default = pkgs.mkShell {
          nativeBuildInputs = [ rustTools ] ++ sharedInputs;

          RUST_SRC_PATH = "${rustTools}/lib/rustlib/src/rust/library";
          RUSTFLAGS = "";
        };
      });
}