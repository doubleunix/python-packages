# This is a pythonPackages *scope* extension:
# self = the extended scope
# super = old scope
pkgs:

  self: super:

  let

    call = self.callPackage;

  in {

    callable-module = call ./callable-module.nix { };
    is-instance     = call ./is-instance.nix { inherit (self) callable-module; };
    assure          = call ./assure.nix { };
    mmry            = call ./mmry.nix { };
    embd            = call ./embd.nix { inherit (self) is-instance assure mmry; };
    kern            = call ./kern.nix { inherit (self) assure mmry; };
    wnix            = call ./wnix.nix { inherit (self) assure mmry is-instance embd kern; };
    python-cowsay   = call ./python-cowsay.nix { };
    python-bin      = call ./python-bin.nix { inherit (self) python-cowsay; };

    dvc-s3                  = call ./dvc-s3.nix { };
    lightgbm                = call ./lightgbm.nix { };
    tflite-runtime          = call ./tflite-runtime.nix { };
    lambda-multiprocessing  = call ./lambda-multiprocessing.nix { };
  }
