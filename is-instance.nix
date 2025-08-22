{ lib , buildPythonPackage , fetchPypi , pip , setuptools , python , callable_module, ... }:

buildPythonPackage rec {
  pname = "is_instance";
  version = "latest";
  pyproject = true;

  # fetch source
  src = fetchPypi {
    inherit pname version;
    sha256 = "810ae53cbb7adb05d791af9dda619c159d897f82c23c5e4f3d72532a8d76cb24";
  };

  buildInputs = [ ];
  propagatedBuildInputs = [ callable_module ];
}
