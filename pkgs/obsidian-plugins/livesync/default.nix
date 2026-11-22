{ pkgs, lib }:
pkgs.stdenv.mkDerivation rec {
  pname = "obsidian-livesync";
  version = "1.0.51";
  src = null;
  dontUnpack = true;

  installPhase = ''
    mkdir -p $out
    cp ${
      pkgs.fetchurl {
        url = "https://github.com/vrtmrz/obsidian-livesync/releases/download/${version}/main.js";
        sha256 = "sha256-umR4LNKlocMrdhsxUw52rzYdjCnru5FodTt+7gSwTJY=";
      }
    } $out/main.js

    cp ${
      pkgs.fetchurl {
        url = "https://github.com/vrtmrz/obsidian-livesync/releases/download/${version}/manifest.json";
        sha256 = "sha256-QnUygL5UEYw89Boqjfi3+pLB/jZo+dOUPfDZ7rlGLmY=";
      }
    } $out/manifest.json

    cp ${
      pkgs.fetchurl {
        url = "https://github.com/vrtmrz/obsidian-livesync/releases/download/${version}/styles.css";
        sha256 = "sha256-aHAdyAgH8FfChJbIMR3xG1UU+iquhifpdKpaK9mlPYU=";
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
