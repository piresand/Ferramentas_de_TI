#!/bin/bash

#########################################################################################################
# Scritp_de_Instalacao_Zabbix_6.0_Debian_10-(Buster)_PostgreSQL_13_Apache.sh
# Filename: Scritp_de_Instalacao_Zabbix_6.0_Debian_10-(Buster)_PostgreSQL_13_Apache.sh 
# Revision: 1.0
# Date: 12/04/2022
# Author: André Pires 
# Github: https://github.com/piresand
# Adaptado: https://github.com/MagnoMonteCerqueira/Zabbix/tree/master/Zabbix_6.0/Instalalacoes/Scritps
##########################################################################################################

# Faz p update dos pacotes no repositorio e instala as dependencias
apt-get update
apt-get -y install sudo gnupg2

# Install Zabbix repository
cd /tmp && wget https://repo.zabbix.com/zabbix/6.0/debian/pool/main/z/zabbix-release/zabbix-release_6.0-1+debian10_all.deb
sudo dpkg -i zabbix-release_6.0-1+debian10_all.deb
sudo apt update

# Install Zabbix server, frontend, agent e banco de dados sudo 
sudo apt-get -y install zabbix-server-pgsql zabbix-frontend-php php7.3-pgsql zabbix-apache-conf zabbix-sql-scripts zabbix-agent postgresql-13

# Criar banco de dados e o usuario do banco
sudo sed -i "s/ident/md5/g" /etc/postgresql/13/main/pg_hba.conf
sudo -u postgres psql -c "create user zabbix with encrypted password 'zabbix'" 2>/dev/null
sudo -u postgres createdb -O zabbix -E Unicode -T template0 zabbix 2>/dev/null

# faz o upload das tabelas
zcat /usr/share/doc/zabbix-sql-scripts/postgresql/server.sql.gz | sudo -u zabbix psql zabbix

# Configuração do zabbix server
sudo sed -i "s/# DBHost=localhost/DBHost=localhost/" /etc/zabbix/zabbix_server.conf
sudo sed -i "s/# DBPassword=/DBPassword=zabbix/" /etc/zabbix/zabbix_server.conf
 
# Configuração do postgres
sudo sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/" /etc/postgresql/13/main/postgresql.conf

# Configuração do apache do zabbix
sudo sed -i "s/#        listen          80;/        listen          80;/" /etc/zabbix/apache.conf
sudo sed -i "s/#        server_name     example.com;/        server_name     example.com;/" /etc/zabbix/apache.conf
sudo rm /etc/apache/sites-available/default
sudo rm /etc/apache/sites-enabled/default
sudo rm /etc/apache/conf.d/zabbix.conf
sudo ln -s /etc/zabbix/apache.conf /etc/apache/sites-available/default
sudo ln -s /etc/zabbix/apache.conf /etc/apache/sites-enabled/default

# reinicia os serviços envolvidos e coloca para iniciar durante o reboot do sistema operacional
sudo systemctl restart zabbix-server zabbix-agent apache php7.3-pgsql postgresql@13-main 
sudo systemctl enable zabbix-server zabbix-agent apache php7.3-pgsql postgresql@13-main