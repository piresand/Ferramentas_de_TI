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

Acessar a Controladora e configurar o AP: https://br.naas.huaweicloud.com/unisso/login.action?service=%2Funisess%2Fv1%2Fauth%3Fservice%3D%252FcampusNCE%252FcampusNCEIndex.html

  Informações úteis;
  
    ***O AP suporta até 16 SSIDs
    ***1000 user simultâneos (max teórico, recomendado 100 users)

Configurações a serem habilitadas na Cloud referente à adoção dos AP;

SEMPRE HABILITAR  

    DNS snooping:  (Previne ataque de dns e identificação dos ativos)   
    mDNS snooping:  (Orientado para identificação de apple)  
    Band steering (5G-prioritized): (Priorização do 5G)   
    User isolation: (Separar os usuários para não se verem)   
    IGMP snooping: (Controle de multicast na rede)   
    Multicast-to-unicast conversion:   Auto   
    U-APSD: (Controle de pós save)    
    802.11r fast roaming: Enable Disable (fara o roaming dos APs mais rápido)   
    802.11r over the DS:  (Gerenciar quem não possuir a tecnologia 11r)    
    Device-pipe collaborative roaming:  (faz interação entre o AP e o client para ficar automático)   

NEXT 

    Semi-open network   
    Key:  (Set)    

NEXT (coleta estatísticas de tráfego)    

    Application traffic statistics collection:   
 
Baixar Firmwares: https://support.huawei.com/enterprise/en/wlan/airengine-6760-x1-pid-250566599/software?offeringId=250400201
Documentação: https://support.huawei.com/hedex/hdx.do?docid=EDOC1100192519&lang=en&idPath=24030814%7C21782164%7C21782201%7C24017540%7C250566599
Huawei AirEngine Wi-Fi 6 Technologies and Products: https://info.support.huawei.com/network/ptmngsys/Web/OnlineCourse_WLAN/en/mooc/wdm/index_en_1.html
WLAN NetTech TV: https://info.support.huawei.com/network/ptmngsys/Web/OnlineCourse_WLAN/en/learning.html
Introduction to Network Planning and Site Survey: https://info.support.huawei.com/network/ptmngsys/Web/OnlineCourse_WLAN/en/mooc/wdm/index_en_4.html
Curso HCIA-WLAN Course: https://talent.huaweiuniversity.com/portal/courses/HuaweiX+EBGTC00000105/about
Curso HCIA-Routing & Switching Course: https://talent.huaweiuniversity.com/portal/courses/course-v1:HuaweiX+EBGTC00000385+Self-paced/about
Curso HCIP-R&S-IERS Training V2.5 (OSPF e routing): https://talent.huaweiuniversity.com/portal/courses/course-v1:HuaweiX+EBGTC00000148+2018.7/about


  
