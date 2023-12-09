{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  inputs.utils.url = "github:numtide/flake-utils";

  outputs = { nixpkgs, utils, ... }:
    (utils.lib.eachDefaultSystem (system:
      let pkgs = import nixpkgs { inherit system; };
      in
      {
        devShells.default = pkgs.mkShell {
          packages = [ pkgs.fish pkgs.texlive.combined.scheme-full ];
          shellHook = "fish && exit";
        };
      }));

}
