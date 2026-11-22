{
  lib,
  fetchFromGitHub,
  mkHyprlandPlugin,
  nix-update-script,
}:

mkHyprlandPlugin {
  pluginName = "hyprspace";
  version = "0-unstable-2026-10-30";

  src = fetchFromGitHub {
    owner = "KZDKM";
    repo = "hyprspace";
    rev = "8345bf6f623d486ca3f87f416ccf1412416eef08";
    hash = "sha256-4b3RPW+fEP0HLFFnY3JnRgeAspgpWa1Cjzlq3UKmQLk=";
  };

  dontUseCmakeConfigure = true;

  installPhase = ''
    runHook preInstall

    mkdir -p $out/lib
    mv Hyprspace.so $out/lib/libhyprspace.so

    runHook postInstall
  '';

  passthru.updateScript = nix-update-script { extraArgs = [ "--version=branch" ]; };

  meta = {
    homepage = "https://github.com/KZDKM/Hyprspace";
    description = "Workspace overview plugin for Hyprland";
    license = lib.licenses.gpl2Only;
    platforms = lib.platforms.linux;
  };
}
