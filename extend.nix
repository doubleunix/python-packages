# python/extend.nix
# This is a pythonPackages *scope* extension: self = the extended scope, super = old scope
pkgs:

  self: super:
  let
    call = self.callPackage;
  in {

    callable_module = call ./callable-module.nix {};
    is_instance     = call ./is-instance.nix { inherit (self) callable_module; };
    assure          = call ./assure.nix {};
    mmry            = call ./mmry.nix {};
    embd            = call ./embd.nix { inherit (self) is_instance assure mmry; };
    kern            = call ./kern.nix { inherit (self) assure mmry; };
    wnix            = call ./wnix.nix { inherit (self) assure mmry is_instance embd kern; };

    python-cowsay = call ./python-cowsay.nix {
      inherit (pkgs) lib;
      inherit (self) buildPythonPackage fetchPypi pip setuptools;
    };

    python-bin = call ./python-bin.nix {
      inherit (pkgs) lib;
      inherit (self) buildPythonPackage fetchPypi pip setuptools python-cowsay;
    };

    dvc-s3                  = call ./dvc-s3.nix { };
    lightgbm                = call ./lightgbm.nix { };
    tflite-runtime          = call ./tflite-runtime.nix { };
    lambda-multiprocessing  = call ./lambda-multiprocessing.nix { };

  }
