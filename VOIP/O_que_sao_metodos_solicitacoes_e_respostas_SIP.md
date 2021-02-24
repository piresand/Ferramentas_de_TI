# O que são métodos / solicitações e respostas SIP?

#### O SIP usa Métodos / Solicitações e Respostas correspondentes para se comunicar e estabelecer uma sessão de chamada.

### SIP requests

##### Métodos mais básicos de solicitação SIP:
                
    UPDATE = Modifica o estado de uma sessão sem alterar o estado da caixa de diálogo.                                     
    SUBSCRIBE = Assina (Subscribes) notificação do notificador.                         
    REGISTER = Comunica a localização do usuário (nome do host, IP).                        
    REFER = Solicita ao destinatário que faça a transferência de chamadas.                                    
    PUBLISH = Publica um evento no servidor (central).                                   
    PRACK = Reconhecimento Provisório.                                    
    OPTIONS = Comunica informações sobre os recursos dos telefones SIP de chamada e recepção.                                   
    NOTIFY = Notifica o assinante (subscriber) sobre um novo evento.                                    
    MESSAGE = Transporta mensagens instantâneas.                                   
    INVITE = Estabelece uma sessão.                                     
    INFO =  Envia informações no meio da sessão.                                      
    CANCEL = Cancela o estabelecimento de uma sessão.                                    
    BYE = Termina uma sessão.                                      
    ACK = Confirma uma solicitação INVITE.    
### Exemplo:      
#### Uma Request:
    “Quero registrar o ramal 123”        

#### Uma Response:
    “Você não está autorizado”                              
### SIP Responses

    As respostas para cada REQUEST são dadas em números de 3 dígitos e separadas por classes. São elas:

    1XX Informação temporária da chamada. Ex: 180 ringing, 100 Trying.

    2XX Informação de sucesso. Ex: 200 OK.

    3XX Informação sobre redirecionamento. Ex: 302 Moved Temporarily.

    4XX Informação de erro vinda do lado do cliente. Ex: 401 Unauthorized.

    5XX Informação de erro vinda do lado do servidor. Ex: 503 Service Unavailable.

    6XX Informação de erros globais, não sendo necessariamente do lado do cliente ou do servidor, 
    por exemplo quando o usuário destino recusa a chamada. Ex: 603 Decline.

#### Outras:

    699 Global Failure - Others              
    608 Rejected                       
    607 Unwanted                             
    606 Not Acceptable                         
    604 Does Not Exist Anywhere                
    603 Decline                                
    600 Busy Everywhere                        
    599 Server Error - Others                  
    513 Message Too Large                      
    505 Version Not Supported                  
    504 Server Time-out                        
    503 Service Unavailable                    
    502 Bad Gateway                            
    501 Not Implemented                        
    500 Server Internal Error                  
    499 Client Error - Others                  
    494 Security Agreement Required             
    493 Undecipherable                         
    491 Request Pending                        
    489 Bad Event                              
    488 Not Acceptable Here                    
    487 Request Terminated                     
    486 Busy Here                              
    485 Ambiguous                              
    484 Address Incomplete                     
    483 Too Many Hops                          
    482 Loop Detected                          
    481 Call/Transaction Does Not Exist             
    480 Temporarily Unavailable                
    470 Consent Needed                         
    440 Max-Breadth Exceeded                   
    439 First Hop Lacks Outbound Support             
    438 Invalid Identity Header                
    437 Unsupported Certificate                
    436 Bad Identity-Info                      
    433 Anonymity Disallowed                   
    430 Flow Failed                            
    429 Provide Referrer Identity              
    428 Use Identity Header                    
    423 Interval Too Brief                     
    422 Session Timer Too Small                
    421 Extension Required                     
    420 Bad Extension                          
    416 Unsupported URI Scheme                 
    415 Unsupported Media Type                 
    414 Request-URI Too Long                   
    413 Request Entity Too Large               
    412 Conditional Request Failed             
    410 Gone                                   
    408 Request Timeout                        
    407 Proxy Authentication Required             
    406 Not Acceptable                         
    405 Method Not Allowed                     
    404 Not Found                              
    403 Forbidden                              
    402 Payment Required                       
    401 Unauthorized                           
    400 Bad Request                            
    399 Redirection - Others                   
    380 Alternative Service                    
    305 Use Proxy                              
    302 Moved Temporarily                      
    301 Moved Permanently                      
    300 Multiple Choices                       
    299 Success - Others                       
    204 No Notification                        
    202 Accepted                               
    200 OK                                 
    199 Informational - Others                 
    183 Session Progress                       
    182 Queued                                 
    181 Call Is Being Forwarded                
    180 Ringing                                
    100 Trying  