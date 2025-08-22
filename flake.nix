{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  inputs.utils.url = "github:numtide/flake-utils";

  outputs = { nixpkgs, utils, ... }:
    (utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        devShells.default = pkgs.mkShell {
          packages = [
            pkgs.fish
            pkgs.typst
          ];
          TYPST_FONT_PATHS = "${pkgs.google-fonts}/share/fonts/truetype:${pkgs.font-awesome}/share/fonts/opentype";
          shellHook = "fish && exit";
        };
      }));

}
