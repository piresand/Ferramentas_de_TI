# COMANDOS RÁDIO UBIQUIT

### Atualização de Firmware por SSH    
##### Carregar a Firmware pela web    
	ubntbox fwupdate.real -m /tmp/fwupdate.bin

#### Ver parâmetros do Rádio   
	wstalist
 #### Adicionar IP de gerência SSH   
    
    ifconfig br0 10.10.60.11 netmask 255.255.255.0 && route add default gw 10.10.60.1
#### Adicionando IP de gerência SSH   
    XM.v5.3.5.# vi /tmp/system.cfg
    i (para editar
    netconf.1.alias.1.comment=
    netconf.1.alias.1.ip=10.10.60.11
    netconf.1.alias.1.netmask=255.255.255.0
    netconf.1.alias.1.status=enabled

    route.2.comment=
    route.2.gateway=10.10.60.1
    route.2.ip=15.160.54.0
    route.2.netmask=255.255.255.0
    route.2.status=enabled
#### Mudar frequência ou outro parâmetro
    XM.v5.3.5.# vi /tmp/system.cfg
    i (para editar)
    wireless.1.scan_list.channels=6010,5720,5300,5240

    esc
    :WQ
    save
    reboot
#### Complice Test

    touch /etc/persistent/ct
    save
    reboot
### Remover worm

    rm /etc/persistent/rc.poststart
    rm /etc/persistent/mf.tar
    rm -rf /etc/persistent/.skynet
    rm -r /etc/persistent/.mf
    cfgmtd -w -p /etc/
    reboot      

#### Conferimos com

    touch /etc/persistent/ ls -la 
    ls -al

    vi /tmp/system.cfg 
#### Direcionamento de porta por SSH

    iptables.sys.portfw.1.comment=EDITAR
    iptables.sys.portfw.1.devname=ppp+
    iptables.sys.portfw.1.dport=3389
    iptables.sys.portfw.1.dst=0.0.0.0/0
    iptables.sys.portfw.1.host=10.1.1.25 - IP CLIENTE
    iptables.sys.portfw.1.port=3389
    iptables.sys.portfw.1.proto=TCP
    iptables.sys.portfw.1.src=0.0.0.0/0
    iptables.sys.portfw.1.status=enabled

    vi /tmp/system.cfg

    i --> Edita 
    esc --> Sai da Edição 
    :wq --> Salva e Sai 