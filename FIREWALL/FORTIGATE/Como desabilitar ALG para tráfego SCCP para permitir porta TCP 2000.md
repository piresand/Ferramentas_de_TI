# Como desabilitar ALG para tráfego SCCP para permitir porta TCP 2000 

Descrição: 
Em algumas situações, o tráfego via porta 2000 TCP pode ser descartado no Firewall Fortigate.

Este texto descreve como desabilitar ALG para tráfego SCCP (porta 2000 TCP) da CLI caso a porta 2000 esteja sendo usada por outro aplicativo e precise ser permitida.

A partir do FortiOS 5.2, todo tráfego SIP e SCCP (Skinny Client Control Protocol (SCCP)) é processado pelo VoIP ALG por default. Caso não haja tráfego SCCP válido, o tráfego é descartado do ALG.

O protocolo SCCP de sinalização é proprietário da Cisco utilizado para controlar os telefones IP Cisco. O SCCP também pode controlar portas analógicas (FXS) como um serviço complementar para os gateways de voz.

Existe um outro serviço conhecido como SCCP (Signalling Connection Control Part), que é um protocolo da camada de rede que fornece facilidades estendidas de roteamento, controle de fluxo, segmentação, orientação de conexão e correção de erros nas redes de telecomunicações do Signaling System 7.

Solução: 

Segue abaixo os comandos necessários para desabilitar VoIP ALG para tráfego SCCP.

#config voip profile
(profile)#edit default
(default)#config sccp
(sccp)#set status disable
(sccp)#end
(default)#end

Fonte: https://kb.fortinet.com/kb/documentLink.do?externalID=FD46259
https://www.dltec.com.br/blog/cisco/protocolos-de-sinalizacao-e-controle-de-dispositivos-voip-ccna-voice/
https://en.wikipedia.org/wiki/Signalling_Connection_Control_Part
