{ lib, ... }:
{
  name = "amazon-ssm-agent";
  meta.maintainers = [ lib.maintainers.anthonyroussel ];

  nodes.machine = {
    services.amazon-ssm-agent.enable = true;
  };

  testScript = ''
    start_all()

    machine.wait_for_file("/etc/amazon/ssm/seelog.xml")
    machine.wait_for_file("/etc/amazon/ssm/amazon-ssm-agent.json")

    machine.wait_for_unit("amazon-ssm-agent.service")
  '';
}
