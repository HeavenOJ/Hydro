{ pkgs ? import <nixpkgs> { system = "x86_64-linux"; } }:

pkgs.dockerTools.buildImage {
  name = "hydrooj/ac";
  tag = "fuckest";

  contents = [
    pkgs.mongodb-4_2
    pkgs.minio
    pkgs.nodejs
    pkgs.yarn
  ];
  runAsRoot = ''
    {pkgs.runtimeShell}
    system("mkdir -p /data/db")
    yarn global add pm2 hydrooj @hydrooj/ui-default @hydrooj/hydrojudge
    hydrooj addon add @hydrooj/hydrojudge
    hydrooj addon add @hydrooj/ui-default
  '';

  config = {
    WorkingDir = "/data";
    Volumes = { "/data" = { }; };
    ExposedPorts = {
      "8888" = { };
    };
    Entrypoint = [ "/entrpont.shit" ];
  };
}
