{ lib , buildPythonPackage , fetchFromGitHub , pip , setuptools , python , callable_module, ... }:

buildPythonPackage rec {
  pname = "is_instance";
  version = "latest";
  pyproject = true;

  # fetch source
  src = fetchFromGitHub {
    owner = "notarealdeveloper";
    repo = "is-instance";
    rev = "bb943236bbd8bfeb98e372d780a52017420ed8c4";
    hash = "sha256-VDWjklBXRIXNeV9kHPlJDgx+2tRKySn60yC8cNgTh2Y=";
  };

  # PyPI dependencies
  propagatedBuildInputs = [ pip setuptools callable_module ];
}
