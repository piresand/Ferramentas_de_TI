

![image](https://user-images.githubusercontent.com/30474126/121080549-8cc42f80-c7a9-11eb-9e70-f3ad1137b502.png) 

Fonte de instalação Zabbix [aqui](https://www.zabbix.com/br/download?zabbix=5.0&os_distribution=centos&os_version=8&db=mysql&ws=apache)   

#### Instalação do Zabbix Server 

## DOCUMENTAÇÃO ##
Versão do Zabbix: 5.0 LTS   
Distribuição de S.O: CentOS   
Versão de S.O: 8   
Banco de Dados: MySQL   
Web Server: Apache   
  
## INSTALAÇÃO DO ZABBIX SERVER ##   

Instale o repositório Zabbix   

    # rpm -Uvh https://repo.zabbix.com/zabbix/5.0/rhel/8/x86_64/zabbix-release-5.0-1.el8.noarch.rpm   
    # dnf clean all   

Instale o servidor, o frontend e o agente Zabbix   

    # dnf install zabbix-server-mysql zabbix-web-mysql zabbix-apache-conf zabbix-agent mariadb-server   

Iniciar o banco de dado Mariadb  

    # systemctl start mariadb.service   

Configurar o banco para iniciar com o sistema operacional automaticamente  

    # systemctl enable mariadb.service   

Verificar status do banco   

    # systemctl status mariadb.service  

![image](https://user-images.githubusercontent.com/30474126/121087473-7f5f7300-c7b2-11eb-92a6-2dda29321f3f.png)
   
Configurar a segurança do Banco de Dados  

    # mysql_secure_installation    

Criar banco de dados inicial  

    # mysql -uroot -p  

    mysql> create database zabbix character set utf8 collate utf8_bin;   
    mysql> create user zabbix@localhost identified by 'zabbix';      
    mysql> grant all privileges on zabbix.* to zabbix@localhost;   
    mysql> quit;  

No servidor do Zabbix, importe o esquema inicial e os dados.    

    # zcat /usr/share/doc/zabbix-server-mysql*/create.sql.gz | mysql -uzabbix -p zabbix   

Configure o banco de dados para o servidor Zabbix, edite o arquivo /etc/zabbix/zabbix_server.conf   

    # DBPassword=password (Colocar sua senha)  

![image](https://user-images.githubusercontent.com/30474126/121087834-eaa94500-c7b2-11eb-8910-0089e6a86c06.png)

Configure o PHP para o frontend Zabbix, edite o arquivo /etc/php-fpm.d/zabbix.conf, descomente e defina o fuso horário conforme sua região.   

    # php_value[date.timezone] = America/Cuiaba  

Desabilitar o selinux   

    # vim /etc/selinux/config   

Alterar a linha do selinux para disabled    

    # SELINUX=disabled    

Desabilitar o firewall e reiniciar o centos   

    # systemctl disable firewalld.service   

Acessar pasta  /etc/zabbix/   

    # cd /etc/zabbix/   

Editar o arquivo  zabbix_server.conf, onde ListenPort=10051 está comentado, será necessário remover #  

    # vim zabbix_server.conf

        Antes: #ListenPort=10051
        Depois: ListenPort=10051

![image](https://user-images.githubusercontent.com/30474126/121088808-445e3f00-c7b4-11eb-96c6-620fe63dec4e.png)  

Inicie o servidor Zabbix e os processos do agente  

    # systemctl enable zabbix-server zabbix-agent httpd php-fpm
    # systemctl restart zabbix-server zabbix-agent httpd php-fpm
    # systemctl restart zabbix-server.service
    # systemctl restart zabbix-agent.service

Confirme o status do agent e do Zabbix server  

    # systemctl status zabbix-agent.service  

![image](https://user-images.githubusercontent.com/30474126/121086766-918ce180-c7b1-11eb-8662-6f965d17a616.png)  

    # systemctl status zabbix-server.service  

![image](https://user-images.githubusercontent.com/30474126/121086630-64403380-c7b1-11eb-9328-93631e3b5386.png)  

Pronto, agora é só acessar o zabbix pelo browser  

http://seu_ip/zabbix   

User: Admin   
Passw: zabbix ~ (Senha que vc criou)   

![image](https://user-images.githubusercontent.com/30474126/121088587-f8ab9580-c7b3-11eb-8fed-6363760e4265.png)


##### Lista de comandos úteis Linux

- ls => Lista todos os arquivos do diretório.

- df =>​ Mostra a quantidade de espaço usada no disco rígido.

- top =>​ Mostra o uso da memória.

- cd =>​ Acessa uma determinada pasta (diretório).

- mkdir =>​ Cria um diretório.

- rm =>​ Remove um arquivo/diretório.

- cat =>​ Abre um arquivo.

- vim =>​ para editar/criar arquivos com cores que informam o que e comentário e o que e em uso.

- vi => editor de texto full-screem.

- nano =>​ para editar/criar arquivos sem cores.

- pico => editor de texto screen-oriented, tambem chamado de nano.​

- find / -name + o que deseja => procura o diretório ou arquivo desejado.

- ​tail -f arquivo => utilizado para lermos arquivos de logs.

- chmod +x => deixa o arquivo executavel.

- chmod => muda a proteção do diretorio ou arquivo, exemplo chmod 777
    
