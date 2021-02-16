# COMANDOS MIKROTIK
#### Adicionar IP na Routerboard via CLI

	ip address add address= 10.11.30.39/24 interface=ether5
#### Criar VLAN   

	interface vlan add vlan-id=222 name=vlan222 interface=ether5
#### Criar rota    

	ip route add dst-address=12.10.254.0/24 gateway=10.21.6.1
#### Criar PPPoE Client    

	interface pppoe-client add user=USUARIO_RADIUS password=SENHA_RADIUS interface=ether5
	interface pppoe-client enable number=0
#### Problema: Cliente só acessa sites da google: Exceto cliente que está com pppoe na RB    

    /ip firewall mangle
    add action=change-mss chain=forward in-interface=ether1 new-mss=1410 \    
    passthrough=yes protocol=tcp tcp-flags=syn tcp-mss=1411-65535

    add action=change-mss chain=forward new-mss=1410 out-interface=ether1 \   
    passthrough=yes protocol=tcp tcp-flags=syn tcp-mss=1411-65535

#### Regras para Tratamento de Conexões

    /ip firewall filter
    add action=drop chain=input comment="Descarta Conexoes Invalidas" \
    connection-state=invalid
    add chain=input comment="Aceita Conexoes Estabelecidas" connection-state=\
    established
    add chain=input comment="Aceita Conexoes Relacionadas" connection-state=\
    related
    add chain=input comment="Aceita Conexoes da Rede Local" src-address=\
    10.2.5.0/30
    add action=drop chain=input comment="Dropa TUDO"

#### Regras Controle de Serviços - Utilizando JUMP

    /ip firewall filter
    add action=jump chain=input comment="Direciona para o Filtro SERVICOS" jump-target=servicos protocol=tcp
    add chain=servicos comment="Libera FTP Externo" dst-port=21 protocol=tcp
    add chain=servicos comment="Libera Winbox Externo" dst-port=8291 protocol=tcp
    add chain=servicos comment="Libera WEB Mikrotik Externo" dst-port=80 protocol=tcp
    add chain=servicos comment="Libera SSH Externo" dst-port=22 protocol=tcp
    
#### Regras Para Registro e Bloqueio do PortScan 

    /ip firewall filter
    add action=add-src-to-address-list address-list=PortScanner address-list-timeout=2d chain=input comment=\
    "Cria Lista de IPs Rodando Port Scan" psd=21,3s,3,1
    add action=drop chain=input comment="Dropa PortScan" protocol=tcp src-address-list=PortScanner    

#### Regras Para Registro e Suprime DDoS

    /ip firewall filter
    add action=add-src-to-address-list address-list="Atacantes DDoS" address-list-timeout=2h chain=input comment=\
    "Lista Ataques DDoS" connection-limit=15,32 protocol=tcp tcp-flags=syn
    add action=tarpit chain=input comment="Suprime ataque DDoS" protocol=tcp src-address-list="Atacantes DDoS"

#### Regra TOC TOC

    /ip firewall filter
    add action=add-src-to-address-list address-list=toc address-list-timeout=30s \
    chain=input comment=toctoc-estagio1 disabled=yes dst-port=3333 protocol=tcp
    add action=add-src-to-address-list address-list=toctoc address-list-timeout=30s \
    chain=input comment=toctoc-estagio2 disabled=yes dst-port=1080 protocol=tcp \
    src-address-list=toc
    add action=add-src-to-address-list address-list=suporte-temp \
    address-list-timeout=1h chain=input comment=toctoc-estagioFinal disabled=\
    yes dst-port=2700 protocol=tcp src-address-list=toctoc
    add chain=input comment=Libera-Winbox-Suporte-Temporario disabled=yes dst-port=\
    8291 protocol=tcp src-address-list=suporte-temp
    add action=drop chain=input comment="Dropa TUDO" disabled=yes

    Descrição da Regra: São filtros que permitem acesso remoto ao router após realizar alguns procedimentos

    Obs.: Caso for utilizar, alteração o valor da opção DISABLED para NO

#### Marcação de Pacotes

    /ip firewall mangle
    add action=mark-connection chain=prerouting comment="Marca Conexao Youtube" dst-port=443 layer7-protocol=youtube \
    new-connection-mark=youtube_conn protocol=udp
    add action=mark-packet chain=prerouting connection-mark=youtube_conn new-packet-mark=youtube_pack passthrough=no
    add action=mark-connection chain=prerouting comment="Marca Conexao Facebook" dst-port=443 layer7-protocol=facebook \
    new-connection-mark=facebook_conn protocol=tcp
    add action=mark-packet chain=prerouting connection-mark=youtube_conn new-packet-mark=youtube_pack passthrough=no
    add action=mark-connection chain=prerouting comment="Marca Conexao Fluxo de Dados (DOWNLOAD)" connection-bytes=\
    4000000-999999999 dst-port=80 new-connection-mark=transf-con protocol=tcp
    add action=mark-packet chain=prerouting connection-mark=transf-con new-packet-mark=transf-pkt passthrough=no
    add action=mark-connection chain=prerouting comment="Marca Conexao HTTPS" dst-port=443 new-connection-mark=\
    https_conn protocol=tcp
    add action=mark-packet chain=prerouting connection-mark=https_conn new-packet-mark=https_pack passthrough=no
    add action=mark-connection chain=prerouting comment="Marca Conexao HTTP" dst-port=80 new-connection-mark=http_conn \
    protocol=tcp
    add action=mark-packet chain=prerouting connection-mark=http_conn new-packet-mark=http_pack passthrough=no
    add action=mark-connection chain=prerouting comment="Marca Conexao P2P" new-connection-mark=p2p_conn p2p=all-p2p
    add action=mark-packet chain=prerouting connection-mark=p2p_conn new-packet-mark=p2p_pack passthrough=no
    add action=mark-connection chain=prerouting comment="Marca Conexao PING" icmp-options=8:0 new-connection-mark=\
    ping-con protocol=icmp
    add action=mark-packet chain=prerouting connection-mark=ping-con new-packet-mark=ping-pkt passthrough=no
    add action=mark-connection chain=prerouting comment="Marca Conexao DNS" dst-port=53 new-connection-mark=dns-con \
    protocol=udp
    add action=mark-packet chain=prerouting connection-mark=dns-con new-packet-mark=dns-pkt passthrough=no
    add action=mark-connection chain=prerouting comment="Marca Conexao Restante" new-connection-mark=restante-con
    add action=mark-packet chain=prerouting connection-mark=restante-con new-packet-mark=restante-pkt passthrough=no
##### LAYER 7 PROTOCOL

    /ip firewall layer7-protocol
    add name=facebook regexp="^(.*)(facebook)(.*)\$"
    add name=youtube regexp="^(.*)(youtube)(.*)\$"