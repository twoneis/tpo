# Twoneis' Package Overlay
This flake provides overlays for whatever packages I happen to come across that aren't packaged in nixpkgs or aren't packaged how I want them (+ potentially more in the future).

## Usage example
This example shows how this overlay may be used in a flake to make goJASM available in a dev shell. The example additionally uses [flake-utils](https://github.com/numtide/flake-utils).
```nix
{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    utils.url = "github:numtide/flake-utils";
    tpo.url = "github:twoneis/tpo";
  };

  outputs = { self, nixpkgs, utils, gojasm-flake, ... }: utils.lib.eachDefaultSystem (system:
    let
      pkgs = import nixpkgs {
        inherit system;
        overlays = [ tpo.overlays.default ];
      };
    in {
      devShells.default = pkgs.mkShell {
        packages = with pkgs; [
          ...
        ];
      };
    });
}
```

## Current Packages
- [goJASM](https://github.com/BlackNovaTech/goJASM)
