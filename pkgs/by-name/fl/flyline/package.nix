{
  lib,
  fetchFromGitHub,
  rustPlatform,
}:

rustPlatform.buildRustPackage (finalAttrs: rec {
  pname = "flyline";
  version = "1.3.0";

  src = fetchFromGitHub {
    owner = "HalFrgrd";
    repo = pname;
    tag = "v${finalAttrs.version}";
    sha256 = "sha256-KciBcUsoMCGuw8bHlVBDHAB55lDfyeGoJxBldmj0MVs=";
  };

  cargoHash = "sha256-zTL33etJpEHGPOrw+mUR6JUP1jzPdHBrGYJZjea13WU=";

  checkFlags = [
    "--skip=docker_integration_tests"
  ];

  meta = {
    description = "a Bash plugin to replace readline for a modern line editing experience: syntax highlighting, agent integration, rich prompts, tooltips, fuzzy history search, and more!";
    homepage = "https://github.com/HalFrgrd/flyline";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
