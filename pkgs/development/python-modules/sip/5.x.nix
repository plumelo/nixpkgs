{ lib, fetchPypi, buildPythonPackage, packaging, toml }:

buildPythonPackage rec {
  pname = "sip";
  version = "5.5.0";

  src = fetchPypi {
    pname = "sip";
    inherit version;
    sha256 = "1idaivamp1jvbbai9yzv471c62xbqxhaawccvskaizihkd0lq0jx";
  };

  propagatedBuildInputs = [ packaging toml ];

  # There aren't tests
  doCheck = false;

  pythonImportsCheck = [ "sipbuild" ];

  meta = with lib; {
    description = "Creates C++ bindings for Python modules";
    homepage    = "http://www.riverbankcomputing.co.uk/";
    license     = licenses.gpl3Only;
    maintainers = with maintainers; [ eduardosm ];
  };
}
