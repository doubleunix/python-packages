{
  description = "Python Packages not yet in Nixpkgs";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }: 

    let

      system = "x86_64-linux";

      overlay = (import ./default.nix);

      pkgs = import nixpkgs {
        inherit system;
        overlays = [ overlay ];
        config.allowUnfree = true;
      };

      pypkgs = pkgs.python3Packages;

    in

  rec {

    packages.${system} = rec {

      inherit (pypkgs)
        callable-module
        is-instance
        python-bin
        assure
        mmry
        embd
        kern
        wnix
        webfs

        dvc-s3
        lightgbm
        python-cowsay
        tflite-runtime
        lambda-multiprocessing
      ;

    };

    overlays.default = overlay;

  };
}
