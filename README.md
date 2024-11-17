# Nix templates

Templates are there to help you start your Nix project.

```sh
$ nix flake init --template github:ahhhh-man/nix-templates#<flake>
```

Create a new project using the template of your choice. 

```sh
$ nix flake new --template github:ahhhh-man/nix-templates#<flake> <project-name>
```

# How to use the templates

Once your preferred template has been initialized, you can use the provided shell in two ways: If you have `nix-direnv` installed, you can initialize the environment by running `direnv allow`. Otherwise, you can run `nix develop` to enter the shell.

# Available templates

- [fluxcd](./fluxcd) - FluxCD GitOps template.
- [go](./go) - Golang project.
- [helm](./helm) - Kubernetes Helm chart template.
- [LaTeX](./latex) - LaTeX project.
- [python-venv](./python) - Python project using virtual environment.
- [rust](./rust) - Rust project.
- [shell](./shell) - Shell script utilities.
