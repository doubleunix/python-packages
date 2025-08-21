{
  lib
, buildPythonPackage
, fetchFromGitHub
, pip
, setuptools
, python
, pytest
, sentence-transformers
, is_instance
, assure
, mmry
, ...
} @ inputs:

buildPythonPackage rec {
  pname = "embd";
  version = "latest";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "notarealdeveloper";
    repo = "embd";
    rev = "0a691990db7476db648d8bad07a41b57d7deb79f";
    hash = "sha256-KCvt3DrqsjEl8cSra1x+ukr5F4oRMWOU2QOJLbRKkCk=";
  };

  propagatedBuildInputs = [
    pip
    setuptools
    pytest
    sentence-transformers
    is_instance
    assure
    mmry
  ];
}
