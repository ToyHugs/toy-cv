{
  description = "A Nix flake for building and checking Typst templates";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    typst-check.url = "github:typst/package-check";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, typst-check, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };

        # Override Typst package to use a specific version
        typst = pkgs.typst.overrideAttrs (_: {
          version = "0.13.1";
          src = pkgs.fetchFromGitHub {
            owner = "typst";
            repo = "typst";
            rev = "v0.13.1";
            sha256 = "sha256-vbBwIQt4xWZaKpXgFwDsRQIQ0mmsQPRR39m8iZnnuj0=";
          };
        });

        oxipng = pkgs.oxipng;

        check = "${typst-check.packages.${system}.default}/bin/typst-package-check";
      in {

        apps = {
          lint = {
            type = "app";
            program = toString (pkgs.writeShellScript "lint" ''
              exec ${check} check
            '');
          };

          build = {
            type = "app";
            program = toString (pkgs.writeShellScript "build-typst" ''
              set -e

              echo "Compiling Typst template..."
              ${typst}/bin/typst compile -f png --pages 1 --ppi 250 templates/cv.typ previews/cv.png --font-path .
              ${typst}/bin/typst compile -f png --pages 1 --ppi 250 templates/cover-letter.typ previews/cover-letter.png --font-path .

              echo "Optimizing image with oxipng..."
              ${oxipng}/bin/oxipng -o max previews/cv.png
              ${oxipng}/bin/oxipng -o max previews/cover-letter.png

              cp templates/previews/cv.png thumbnail.png
            ''
            );
          };
        };

        devShells.default = pkgs.mkShell {
          packages = [ typst oxipng typst-check.packages.${system}.default ];
        };
      }
    );
}
