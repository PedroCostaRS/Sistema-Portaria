# Dicas de uso do aplicativo.
-----------------------------------------------------------------

Para alterar a logo, basta substituir imagem.jpg na pasta ícones.(tamanho máximo da imagem é de 300(altura) x 600(Largura) ).

-----------------------------------------------------------------
Instale o servidor xampp ou wampp de acordo com a versão do seu sistema operacional
https://www.apachefriends.org/download.html

Instale o MySql-workbank para a versão do seu sistema operacional.
https://dev.mysql.com/downloads/workbench/

### Coloque em execução os serviços Apache(porta 80, 443) e MySQL(porta 3306)

### Faça uma nova conexão no MySql-workbank com o nome Portaria.
### Crie a base de dados na conexão.
### Apenas copie e cole todo o código a seguir na query aberta e execute.

CREATE SCHEMA Portaria;
use Portaria;

CREATE TABLE MOVIMENTO ( <br>
    ID_MOVIMENTO   INTEGER NOT NULL, <br>
    COD_VISITANTE  INTEGER, <br>
    NOME           VARCHAR(50), <br>
    CPF            VARCHAR(14), <br>
    COD_VEICULO    INTEGER, <br>
    MARCA          VARCHAR(50), <br>
    MODELO         VARCHAR(50), <br>
    PLACA          VARCHAR(10), <br>
    HORA_ENTRADA   VARCHAR(10), <br>
    HORA_SAIDA     VARCHAR(10), <br>
    MOTIVO         VARCHAR(100), <br>
    DATA           DATE <br>
); <br><br><br>


CREATE TABLE VEICULO ( <br>
    COD_VEICULO  INTEGER NOT NULL, <br>
    MARCA        VARCHAR(50), <br>
    MODELO       VARCHAR(50), <br>
    PLACA        VARCHAR(10) <br>
); <br><br><br>


CREATE TABLE VISITANTE ( <br>
    COD_VISITANTE    INTEGER NOT NULL, <br>
    NOME             VARCHAR(50), <br>
    DATA_NASCIMENTO  VARCHAR(10), <br>
    CPF              VARCHAR(14) <br>
); <br><br><br>
 

# Imagens das Telas de Sistema
![Tela Principal](https://user-images.githubusercontent.com/55371875/198746638-d05aed14-bb4b-4542-be74-5ae2bf8e9385.jpg)
-------------------------------------------------------------------
![Cadastro de visitante com validação de CPF](https://user-images.githubusercontent.com/55371875/198746669-f13ad3bc-b430-40db-8075-805a7742e5c2.jpg)
-------------------------------------------------------------------
![Cadastro de Veículo](https://user-images.githubusercontent.com/55371875/198746773-49a60a21-6d65-43c7-be5d-1eb8f8e0abbd.jpg)
-------------------------------------------------------------------
![Controle de entrada e saída de pessoas e veículos](https://user-images.githubusercontent.com/55371875/198746849-f6a6b23d-a25b-4208-a8d5-4495ff53e165.jpg)
