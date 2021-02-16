# COMANDOS FW AKER OGASEC    

#### Verificar chave de hardware    
	akhwsig
#### Limpar os Serviços quando a Control Center demora para carregar alguns serviços     
	cd /etc/init.d/
	akav restart
	asm restart
	awca restart
#### Matar todos os usuários conectados    
	killall -9 fwconfd
##### Criar usuário/ alterar senha e informações   
	akshell
	admin
##### Configurar hora   
	killall -9 fwgenericstd fwscanlogd fwheartd
	killall -9 fwconfd
#### Cluster   
	192.168.168.1/30 -- Master
	192.168.168.2/30 -- slave
	fwcluster habilita slave -f
#### Verificar configurações do Firewall por SSH    
	fwrule mostra -- regras de filtragem
	fwent mostra -- mostra as entidades
#### Informações de licença travada    
	killall -9 aklicd
	ps ax | grep aklicd
	killall -9 fwconfd fwhconfd
	killall -9 akhwsig
	akhwsig start
	akhwsig restart
#### Verificar consumo de processos e memória   
    ps -aux
#### NTOP   
	sudo su

	entrar no diretório  cd /var/lib/redis
	cd /var/lib/redis
	ls

	mover os arquivos (appendonly.aof  dump.rdb) para tmp
	mv appendonly.aof /tmp
	mv dump.rdb /tmp

	parar o serviço e depois startar o serviço do ntop 
	akntopng stop
	akntopng start
#### Corrigir problema de Hora Firewall AKER

    killall -9 fwgenericstd fwscanlogd fwheartd
    killall -9 fwconfd
#### Listar / Trocar ou Adicionar senha de Usuários   
	/aker/bin/firewall $ sudo su
	/aker/bin/firewall # akshell
	>admin

		L = listar usuários cadastrados
		A = Alterar senha do usuário
		S= sair do fwadmin
		I= incluir um novo usuário
#### Comandos no root SUDO SU    
	# sudo su
	fwcluster - mostra
	fwcluster - habilita_slave
	# killall -9  e_o_nome_processo
#### Fwpar Mostra Parâmetros globais   
	/aker/bin/firewall $ sudo su
	/aker/bin/firewall # fwpar 
	
	- Retorno do comando acima:	
	* Parametros de seguranca
	* Parametros de configuracao de log
	* Parametros de configuracao de SNMP

