{
  description = "Python Packages not yet in Nixpkgs";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }: 

    let

      system = "x86_64-linux";

      overlay = (final: prev: with prev; rec {
        pythonPackagesExtensions = [ (import ./default.nix prev ) ];
      });

      pkgs = import nixpkgs {
        inherit system;
        overlays = [ overlay ];
        config.allowUnfree = true;
      };

      pypkgs = pkgs.python3Packages;

    in

  rec {

    legacyPackages.${system} = pkgs;

    packages.${system} = {

      inherit (pypkgs)
        python-cowsay
        python-bin
        callable_module
        is_instance
        assure
        mmry
        embd
        kern
        wnix

        dvc-s3
        lightgbm
        tflite-runtime
        lambda-multiprocessing
      ;

    };

    overlays.default = overlay;

    default = overlays.default;

  };
}
