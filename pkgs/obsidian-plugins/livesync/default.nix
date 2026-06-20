{ pkgs, lib }:
pkgs.stdenv.mkDerivation rec {
  pname = "obsidian-livesync";
  version = "0.25.77";
  src = null;
  dontUnpack = true;

  installPhase = ''
    mkdir -p $out
    cp ${
      pkgs.fetchurl {
        url = "https://github.com/vrtmrz/obsidian-livesync/releases/download/${version}/main.js";
        sha256 = "sha256-KIlKv1BKRxb1QPNz1ulWIXswFlAio4M0K0VpgxE1BV8=";
      }
    } $out/main.js

    cp ${
      pkgs.fetchurl {
        url = "https://github.com/vrtmrz/obsidian-livesync/releases/download/${version}/manifest.json";
        sha256 = "sha256-JQuufYm6knKluW+QlDPaZSE5O44PCjAyPe4pL8jnC4g=";
      }
    } $out/manifest.json

    cp ${
      pkgs.fetchurl {
        url = "https://github.com/vrtmrz/obsidian-livesync/releases/download/${version}/styles.css";
        sha256 = "sha256-N9MXmBhtfpfql55tKq6AIeoawd8sO50rA9ziaZWcJ/M=";
      }
    } $out/styles.css
  '';

  meta = with lib; {
    description = "Self-hosted LiveSync is a community-developed synchronisation plug-in available on all Obsidian-compatible platforms.";
    homepage = "https://github.com/vrtmrz/obsidian-livesync";
    license = licenses.mit;
    platforms = platforms.linux;
  };
}
