

![image](https://user-images.githubusercontent.com/30474126/121080549-8cc42f80-c7a9-11eb-9e70-f3ad1137b502.png)

Fonte de instalação Zabbix: https://www.zabbix.com/br/download?zabbix=5.0&os_distribution=centos&os_version=8&db=mysql&ws=apache

#### Instalação do Zabbix Server 

## DOCUMENTAÇÃO ##
VERSÃO DO ZABBIX: 5.0 LTS   
DISTRIBUIÇÃO DE SO: CentOS   
VERSÃO DE SO: 8   
BANCO DE DADOS: MySQL   
WEB SERVER: Apache   
  
## INSTALAÇÃO DO ZABBIX SERVER ##   
Instale o repositório Zabbix   

#~ rpm -Uvh https://repo.zabbix.com/zabbix/5.0/rhel/8/x86_64/zabbix-release-5.0-1.el8.noarch.rpm   

    #~ dnf clean all   

Instale o servidor, o frontend e o agente Zabbix   

#~ dnf install zabbix-server-mysql zabbix-web-mysql zabbix-apache-conf zabbix-agent mariadb-server   

- Iniciar o banco de dado Mariadb  

#~ systemctl start mariadb.service   

- Configurar o banco para iniciar com o sistema operacional automaticamente  

#~ systemctl enable mariadb.service   

- Verificar status do banco   

#~systemctl status mariadb.service  

- Configurar a segurança do Banco de Dados  

#~ mysql_secure_installation    

- Criar banco de dados inicial  

#~ mysql -uroot -p  

mysql> create database zabbix character set utf8 collate utf8_bin;   
mysql> create user zabbix@localhost identified by 'zabbix';      
mysql> grant all privileges on zabbix.* to zabbix@localhost;   
mysql> quit;  

- No servidor do Zabbix, importe o esquema inicial e os dados.    

#~ zcat /usr/share/doc/zabbix-server-mysql*/create.sql.gz | mysql -uzabbix -p zabbix   

- Configure o banco de dados para o servidor Zabbix   
Editar arquivo /etc/zabbix/zabbix_server.conf   

#~ DBPassword=password (Colocar sua senha)  

- Configure o PHP para o frontend Zabbix    
Editar arquivo /etc/php-fpm.d/zabbix.conf, descomente e defina o fuso horário correto.   

#~ php_value[date.timezone] = America/Cuiaba  

-Desabilitar o selinux   

#~ vim /etc/selinux/config   

Alterar a linha do selinux para disabled   
SELINUX=disabled  

-Desabilitar o firewall e reiniciar o centos   

#~ systemctl disable firewalld.service   



