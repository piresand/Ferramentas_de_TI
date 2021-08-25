################### CONFIG AP HUAWEI AIRENGINE ###################

Primeiro acesso

  IP DEFAULT: 169.254.1.2/24   
  USER: admin   
  PASSWORD: admin@huawei.com     
 
Equivalente ao comando Enable   
  <Huawei>sy   

Ver o Serial number
  display sn   
  display esn  

Retorno do comando  
  SN: 2102353GSJ6RLC001169   
  
Alterando o modo firmware para modo Nuvem (Esse modo reseta o AP)
  ap-mode-switch cloud
  Y

Enable:
  sy

Será necessário recriar as senhas, pois o comando (ap-mode-switch cloud) anterior resetou.
Adoção e conexão para Cloud
  cloud-mng controller url dev-br.naas.huaweicloud.com port 10020

Habilitando A CLOUD QUE ESTAVA DESABILITADA
  undo cloud-mng register-center disable
  quit
  save
  reboot 

Acessar a Controladora e configurar o AP
  https://br.naas.huaweicloud.com/unisso/login.action?service=%2Funisess%2Fv1%2Fauth%3Fservice%3D%252FcampusNCE%252FcampusNCEIndex.html

  
