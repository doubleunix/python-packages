{ lib , buildPythonPackage , fetchPypi , pip , setuptools , python , callable-module, ... }:

buildPythonPackage rec {
  pname = "is_instance";
  version = "0.0.16";
  pyproject = true;

  # fetch source
  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-IuUPSdIwxyBDcDNVoF99CISm7FvqkQq6bqMxHU3bryg=";
  };

  buildInputs = [ ];
  propagatedBuildInputs = [ callable-module ];
}
