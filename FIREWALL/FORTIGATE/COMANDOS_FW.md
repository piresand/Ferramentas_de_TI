## COMANDOS FW FORTIGATE


*** TROUBLESHOOTING   
*** ANÁLISE DE TRÁFEGO DE REDE ***

    diagnose sys session filter src 192.168.3.68
    diagnose sys session filter dst 192.168.3.68
    diagnose sys session clear
    diagnose sniffer packet any 'host 192.168.3.68' 
    diagnose sniffer packet any 'host 192.168.3.68 and icmp'

