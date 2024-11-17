{
  description = "A collection of flake templates";

  outputs = { self }: {

    templates = {
      fluxcd = {
        path = ./fluxcd;
        description = "FluxCD template";
      };

      go = {
        path = ./go;
        description = "Golang template";
      };

      helm = {
        path = ./helm;
        description = "Helm template";
      };

      latex = {
        path = ./latex;
        description = "LaTeX template";
      };

      python-venv = {
        path = ./python-venv;
        description = "Python venv template";
      };

      rust = {
        path = ./rust;
        description = "Rust template";
      };

      shell = {
        path = ./shell;
        description = "Shell template";
      };
    };
  };
}
