# Documentação de configuração de um ambiente AWS e Linux

Este repositório tem como objetivo conter uma documentação necessária para configurar um ambiente AWS e Linux, de acordo com os requisitos citados abaixo.

## Requisitos AWS:
  <li>Gerar uma chave pública para acessar o ambiente;</li>
  <li>Criar uma instância EC2 com sistema operacional Amazon Linux 2 usando uma família de instâncias t3.small com 16 GB de armazenamento SSD;</li>
  <li>Gerar um IP elástico e anexar a instância EC2;</li>
  <li>Permitir o acesso público às portas de comunicação: 22/TCP, 111/TCP e UDP, 2049/TCP e UDP, 80/TCP, 443/TCP).</li>

## Requisitos Linux:
  <li>Configurar um sistema de arquivos de rede(NFS);</li>
  <li>Subir o Apache para o servidor;</li>
  <li>Criar scripts para verificar o estado do servidor apache dentro da instância EC2.</li>

### Gerar uma chave pública para acessar o ambiente
  1. Acessar o console AWS;
  2. Selecionar a opção "EC2";
  3. Na barra de navegação lateral, selecione "Key Pairs" Pares de chaves);
  4. Clicar em "Create Key Pair" (Criar par de chaves);
  5. Definir um nome para a chave e selecione o formato ".pem";
  6. Clicar em "Create Key Pair" (Criar par de chaves);
  7. Baixar o arquivo de chave privada para um local seguro;
  8. Anotar o nome da chave pública, que será usada para acessar a instância EC2.
 
### Criar 1 instância EC2 com o sistema operacional Amazon Linux 2 (Família t3.small, 16 GB SSD)
  1. Acessar o console AWS;
  2. Selecionar a opção "EC2";
  3. Clicar em "Launch Instance" (Executar instância);
  4. Selecionar a opção "Amazon Linux 2";
  5. Selecionar a família "t3.small"
  6. Selecionar o par de chaves criado anteriormente;
  7. Siga os passos de configuração da instância, como nome, tipo de instância, configuração de rede, segurança, etc.;
  8. Selecionar 16GB de armazenameto SSD;
  9. Em detalhes avançados, encontrar o campo "userdata" (dados do usuário) e colocar o seguinte script:
  
  ```
  #!/bin/bash
  yum update -y
  yum install httpd -y
  systemctl enable httpd && systemctl start httpd
  
   ```
   Esse script atualiza o sistema operacional, instala o Apache, habilita e inicia, respectivamente. Será útil para adiantar a criação.

  10. Iniciar a instância.
  
  ### Gerar um IP elástico e anexar a instância EC2
  1. Acessar o console AWS;
  2. Selecionar a opção "EC2";
  3. Na barra de navegação lateral, selecionar "Elastic IPs" (IP elástico);
  4. Clicar em "Allocate new address" (alocar novo endereço);
  5. Selecionar o elastic IP criado e clique em "Actions" (Ações);
  6. Selecionar a opção "Associate IP address" (Alocar endereço de IP);
  7. Selecionar a instância EC2 criada e clique em "Associate" (Associar).
  
  ### Liberar as portas de comunicação para acesso público: (22/TCP, 111/TCP e UDP, 2049/TCP/UDP, 80/TCP, 443/TCP)
  1. Acessar o console AWS;
  2. Selecionar a opção "EC2";
  3. Na barra de navegação lateral, selecionar "Security groups" (Grupos de segurança);
  4. Selecionar o grupo de segurança vinculado a instância EC2 (Geralmente por padrão, o primeiro grupo criado tem o nome de "launch-wizard-1")
  5. Clicar em "Edit inbound rules"(Editar regras de entrada)
  6. Adicionar as regras especificadas acima.
  
  ![image](https://user-images.githubusercontent.com/117855728/229399378-9c173dd1-ef24-46b7-bf41-b00a39675d0b.png)
  
  ##Requisitos Linux:


