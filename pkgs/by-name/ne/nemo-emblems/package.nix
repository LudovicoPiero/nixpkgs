{
  python3,
  lib,
  fetchFromGitHub,
  cinnamon-translations,
}:

python3.pkgs.buildPythonApplication rec {
  pname = "nemo-emblems";
  version = "6.4.0";

  # nixpkgs-update: no auto update
  src = fetchFromGitHub {
    owner = "linuxmint";
    repo = "nemo-extensions";
    rev = version;
    hash = "sha256-39hWA4SNuEeaPA6D5mWMHjJDs4hYK7/ZdPkTyskvm5Y=";
  };

  format = "setuptools";

  sourceRoot = "${src.name}/nemo-emblems";

  postPatch = ''
    substituteInPlace setup.py \
      --replace "/usr/share" "share"

    substituteInPlace nemo-extension/nemo-emblems.py \
      --replace "/usr/share/locale" "${cinnamon-translations}/share/locale"
  '';

  meta = with lib; {
    homepage = "https://github.com/linuxmint/nemo-extensions/tree/master/nemo-emblems";
    description = "Change a folder or file emblem in Nemo";
    longDescription = ''
      Nemo extension that allows you to change folder or file emblems.
      When adding this to nemo-with-extensions you also need to add nemo-python.
    '';
    license = licenses.gpl3Only;
    platforms = platforms.linux;
    teams = [ teams.cinnamon ];
  };
}
