
{ lib
, buildPythonPackage
, fetchPypi
, python-cowsay
, pip
, setuptools
, ... }:

buildPythonPackage rec {
  pname = "python-bin";
  version = "0.0.3";
  pyproject = true;

  src = fetchPypi {
    pname = "python_bin";
    inherit version;
    sha256 = "sha256-Z8YZGqe9XjO7pvRNa7564sC59iN1Wj4GWUNEHOcKW/Y=";
  };

  propagatedBuildInputs = [
    pip
    setuptools
  ];

  meta = with lib; {
    description = "It's bin.";
    homepage    = "https://github.com/notarealdeveloper/python-bin";
    license     = licenses.bsd0;
    platforms   = platforms.unix;
  };
}
