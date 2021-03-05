#### Tenha permisão de root para acesso da crontab
	sudo -i
	crontab -e
#### e então adicione a linha   

	30 17 * * * /usr/sbin/tcpdump -G 12600 -W 1 -s 3000 -w /home/ubuntu/capture-file.pcap port 5060 or portrange 10000-35000    
#### Legenda de Flags do dump   

	- A flag -G indica o número de segundos para a execução do dump.    
	- Neste exemplo o dump é executado diariamente das 17h30 às 21h    
 	- O -W é o número de interações que o tcpdump executará.    
	- Este exemplo foi usado para capturar pacotes de um telefone Asterisk.   
#### Entendendo o Crontab - Agendamento de tarefas em Linux

	O crontab possui seis colunas, que correspondem aos minutos, horas, dias, meses, semanas e, por fim, aos comandos 
	que serão executados.  

	Minuto: Valores de 0 a 59 ou *   
	Hora: Valores de 0 a 23 ou *     
	Dia: Valores de 1 a 31 ou *   
	Mês: Valores de 1 a 12, jan a dec ou *  
	Semana: 0 a 6, sun a sat ou * (0 e 7 representa Domingo)   
	Comando: O comando a ser executado ou script     


	# Exemplo de definição de trabalho    
	# .---------------- minuto (0 - 59)   
	# |  .------------- houra (0 - 23)   
	# |  |  .---------- dia of month (1 - 31)   
	# |  |  |  .------- mês (1 - 12) Ou jan,feb,mar,apr ...  
	# |  |  |  |  .---- dia d semana (0 - 6) (Sunday=0 ou 7) ou sun,mon,tue,wed,thu,fri,sat   
	# |  |  |  |  |   
	# *  *  *  *  *  comando de nome de usuário a ser executado      

	Caso deseje utilizar o mês e semana através dos seus respectivos nomes, deve respeitar a ortografia da língua inglesa.
	No crontab é importante que sempre a última linha fique em branco, ao incluir um novo agendamento quebre a linha no final.     
	Isso evita um bug antigo da ferramenta.    

	Fonte: https://medium.com/totvsdevelopers/entendendo-o-crontab-607bc9f00ed3     



