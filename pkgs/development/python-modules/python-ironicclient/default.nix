{
  lib,
  buildPythonPackage,
  fetchPypi,
  cliff,
  dogpile-cache,
  jsonschema,
  keystoneauth1,
  openstacksdk,
  osc-lib,
  oslo-utils,
  oslotest,
  pbr,
  platformdirs,
  pyyaml,
  requests,
  requests-mock,
  stestr,
  stevedore,
}:

buildPythonPackage rec {
  pname = "python-ironicclient";
  version = "5.7.0";
  format = "setuptools";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-Blx0pr73uZA8eHd2iZ9WY+aozBFWsQhWpxoQKtjtJSk=";
  };

  propagatedBuildInputs = [
    cliff
    dogpile-cache
    jsonschema
    keystoneauth1
    openstacksdk
    osc-lib
    oslo-utils
    pbr
    platformdirs
    pyyaml
    requests
    stevedore
  ];

  nativeCheckInputs = [
    stestr
    requests-mock
    oslotest
  ];

  checkPhase = ''
    stestr run
  '';

  pythonImportsCheck = [ "ironicclient" ];

  meta = with lib; {
    description = "Client for OpenStack bare metal provisioning API, includes a Python module (ironicclient) and CLI (baremetal)";
    mainProgram = "baremetal";
    homepage = "https://github.com/openstack/python-ironicclient";
    license = licenses.asl20;
    maintainers = teams.openstack.members;
  };
}
