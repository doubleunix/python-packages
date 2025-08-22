self: super:

  rec {

    callable-module         = self.callPackage ./callable-module.nix { };
    is-instance             = self.callPackage ./is-instance.nix { inherit (self) callable-module; };
    assure                  = self.callPackage ./assure.nix { };
    mmry                    = self.callPackage ./mmry.nix { };
    embd                    = self.callPackage ./embd.nix { inherit (self) is-instance assure mmry; };
    kern                    = self.callPackage ./kern.nix { inherit (self) assure mmry; };
    wnix                    = self.callPackage ./wnix.nix { inherit (self) is-instance assure mmry embd kern; };
    python-bin              = self.callPackage ./python-bin.nix { inherit (self) python-cowsay; };

    dvc-s3                  = self.callPackage ./dvc-s3.nix { };
    lightgbm                = self.callPackage ./lightgbm.nix { };
    python-cowsay           = self.callPackage ./python-cowsay.nix { };
    tflite-runtime          = self.callPackage ./tflite-runtime.nix { };
    lambda-multiprocessing  = self.callPackage ./lambda-multiprocessing.nix { };
  }
