## COMANDOS FW FORTIGATE


# TROUBLESHOOTING   

*** ANÁLISE DE TRÁFEGO DE REDE ***    

   	diagnose sys session filter src 192.168.3.68
    diagnose sys session filter dst 192.168.3.68
    diagnose sys session clear
    diagnose sniffer packet any 'host 192.168.3.68' 
    diagnose sniffer packet any 'host 192.168.3.68 and icmp'
    diagnose sys top-summary
    get system performance status 
    diagnose sys top 1 45
    get system startup-error-log

#### PRIORIDADE VPN NA SDWAN 
    config system virtual-wan-link 
    config members 
    edit (numero da interface que esta na sdwan)
    set priority 10 
    end

OBS/: só precisará mexer se for criado uma nova VPN SDWAN