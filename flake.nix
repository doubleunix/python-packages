{
  description = "Python Packages not yet in Nixpkgs";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }: 

    let

      system = "x86_64-linux";

      overlay = import ./default.nix;

      pkgs = import nixpkgs {
        inherit system;
        overlays = [ overlay ];
        config.allowUnfree = true;
      };

      pypkgs = pkgs.python3Packages;

    in

  {

    overlays.default = overlay;

    legacyPackages.${system} = pkgs;

    packages.${system} = {

      inherit (pypkgs)
        callable_module
        is_instance
        assure
        mmry
        embd
        kern
        wnix
        python-bin

        python-cowsay
        dvc-s3
        lightgbm
        tflite-runtime
        lambda-multiprocessing
      ;

    };
  };
}
