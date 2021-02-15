# COMANDOS MIKROTIK

#### Criar IP na interface    

	ip address add address= 10.191.30.39/24 interface=ether5
 
#### Criar VLAN   

	interface vlan add vlan-id=222 name=vlan222 interface=ether5

#### Criar rota    

	ip route add dst-address=172.16.254.0/24 gateway=10.221.6.181

#### Criar PPPoE Client    

	interface pppoe-client add user=USUARIO_RADIUS_INTEGRATOR password=SENHA_RADIUS_INTEGRATOR interface=ether5
	interface pppoe-client enable number=0

##### Problema: Cliente só acessa sites da google: Exceto cliente que está com pppoe na RB    

    /ip firewall mangle
    add action=change-mss chain=forward in-interface=ether1 new-mss=1410 \    
    passthrough=yes protocol=tcp tcp-flags=syn tcp-mss=1411-65535

    add action=change-mss chain=forward new-mss=1410 out-interface=ether1 \   
    passthrough=yes protocol=tcp tcp-flags=syn tcp-mss=1411-65535