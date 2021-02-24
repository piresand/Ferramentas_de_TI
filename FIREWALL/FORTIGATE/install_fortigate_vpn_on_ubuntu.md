# INSTALAÇÃO DO FORTICLIENT (6.4) VPN NO UBUNTU    

#### Instalação via terminal linux       

    wget https://filestore.fortinet.com/forticlient/downloads/FortiClientFullVPNInstaller_6.4.0.0851.deb

    sudo dpkg -i FortiClientFullVPNInstaller_6.4.0.0851.deb

    sudo apt install ./FortiClientFullVPNInstaller_6.4.0.0851.deb

##### Instalando repositório Fortinet    

    wget -O - https://repo.fortinet.com/repo/ubuntu/DEB-GPG-KEY | sudo apt-key add -
    
    echo "deb [arch=amd64] https://repo.fortinet.com/repo/ubuntu/ /bionic multiverse" | sudo tee /etc/apt/sources.list.d/fortinet.list

##### Atualização dos pacotes    

     apt update

