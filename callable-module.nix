{ lib , buildPythonPackage , fetchFromGitHub , pip , setuptools , python , ... }:

buildPythonPackage rec {
  pname = "callable_module";
  version = "latest";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "notarealdeveloper";
    repo = "callable-module";
    rev = "b0012e03e6a3d607eddc773f29d713765a561b40";
    hash = "sha256-jEMTI/XZwe67Ta51F6IafK5U/M2Ixt3Vh4TA5+RZOAA=";
  };

  propagatedBuildInputs = [ pip setuptools ];
}
