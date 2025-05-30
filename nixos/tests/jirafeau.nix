{ lib, ... }:

{
  name = "jirafeau";
  meta.maintainers = [ ];

  nodes.machine =
    { pkgs, ... }:
    {
      services.jirafeau = {
        enable = true;
      };
    };

  testScript = ''
    machine.start()
    machine.wait_for_unit("phpfpm-jirafeau.service")
    machine.wait_for_unit("nginx.service")
    machine.wait_for_open_port(80)
    machine.succeed("curl -sSfL http://localhost/ | grep 'Jirafeau'")
  '';
}
