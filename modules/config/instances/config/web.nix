{ instancesFunctions }:
let
  inherit (instancesFunctions)
    domain0
    domain1
    domain2
    domain3
    ;
in
{
  domains = {
    url0 = domain0;
    url1 = domain1;
    url2 = domain2;
    url3 = domain3;
  };
  dns = {
    provider0 = "namecheap";
  };
  localhost = {
    address0 = "127.0.0.1"; # Local
    address1 = "0.0.0.0"; # All
    address2 = "192.168.50.1"; # Router
    address3 = "192.168.50.0"; # Router
  };
}
