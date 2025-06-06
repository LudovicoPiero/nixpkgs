{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  pytestCheckHook,
}:

buildPythonPackage {
  pname = "yaswfp";
  version = "unstable-20210331";
  format = "setuptools";

  src = fetchFromGitHub {
    owner = "facundobatista";
    repo = "yaswfp";
    rev = "2a2cc6ca4c0b4d52bd2e658fb5f80fdc0db4924c";
    sha256 = "1dxdz89hlycy1rnn269fwl1f0qxgxqarkc0ivs2m77f8xba2qgj9";
  };

  nativeCheckInputs = [ pytestCheckHook ];

  pythonImportsCheck = [ "yaswfp" ];

  meta = with lib; {
    description = "Python SWF Parser";
    mainProgram = "swfparser";
    homepage = "https://github.com/facundobatista/yaswfp";
    license = with licenses; [ gpl3Only ];
    maintainers = with maintainers; [ fab ];
  };
}
