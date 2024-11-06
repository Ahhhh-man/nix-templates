{
  description = "Python venv development template";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
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
        pkgs = import nixpkgs {inherit system;};
        buildInputs = with pkgs; [
            python3
            python3Packages.venvShellHook
            python3Packages.black
            python3Packages.flake8
            just
        ];
      in
      {
        devShells.default = pkgs.mkShell {
          name = "python-venv";
          venvDir = "./.venv";
          inherit buildInputs;

          postVenvCreation = ''
            unset SOURCE_DATE_EPOCH
            pip install -r requirements.txt
          '';

          postShellHook = ''
            # allow pip to install wheels
            unset SOURCE_DATE_EPOCH
          '';
        };
      }
    );
}