{
  description = "A collection of flake templates";

  outputs = { self }: {

    templates = {
      go = {
        path = ./go;
        description = "Golang template";
      };

      rust = {
        path = ./rust;
        description = "Rust template";
      };

      python-venv = {
        path = ./python-venv;
        description = "Python venv template";
      };

      fluxcd = {
        path = ./fluxcd;
        description = "FluxCD template";
      };

      helm = {
        path = ./helm;
        description = "Helm template";
      };
    };
  };
}
