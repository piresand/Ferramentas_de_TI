# COMANDOS RÁDIO UBIQUIT

#### Forçar Update/Downgrade de FIRMWARE POR SSH   

    ubntbox fwupdate.real -m /tmp/fwupdate.bin

#### Adicionar IP DE GERENCIA    
    
    ifconfig br0 10.10.60.11 netmask 255.255.255.0 && route add default gw 10.10.60.1


#### Adicionando IP de gerência SSH
XM.v5.3.5.# vi /tmp/system.cfg

netconf.1.alias.1.comment=
netconf.1.alias.1.ip=10.100.60.113
netconf.1.alias.1.netmask=255.255.255.0
netconf.1.alias.1.status=enabled

route.2.comment=
route.2.gateway=10.100.60.1
route.2.ip=172.16.254.0
route.2.netmask=255.255.255.0
route.2.status=enabled
