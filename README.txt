# Projeto com Docker Compose

## Visão Geral

Este projeto tem como objetivo criar uma aplicação **fullstack** utilizando **Flask** para o backend, **React** para o frontend e **PostgreSQL** como banco de dados. Além disso, o **NGINX** é configurado para servir o frontend e atuar como um **proxy reverso**, distribuindo as requisições entre duas instâncias do backend.

## Objetivos do Projeto:
- Entender como usar o **Docker Compose** para gerenciar múltiplos container e serviços.
- Configurar um **proxy reverso** com **NGINX**.
- Conectar um backend Flask a um banco de dados PostgreSQL.

## Estrutura do Projeto

1. **Backend (Flask)**:
   - Uma API simples criada com Flask (Python).
   - Realiza operações de leitura e escrita no banco de dados PostgreSQL.

2. **Frontend (React)**:
   - Interface de usuário simples.
   - Servido pelo NGINX.

3. **NGINX**:
   - Atuará como **proxy reverso**, redirecionando requisições ao backend.
   - Implementa um **balanceamento de carga** entre duas instâncias do backend.

4. **PostgreSQL**:
   - Banco de dados utilizado para armazenar informações.

---

## Requisitos

Antes de começar, você precisa ter instalado:
- [Docker](https://www.docker.com/) 
- [Docker Compose](https://docs.docker.com/compose/)

Se você ainda não possui o Docker configurado, consulte a documentação oficial para seu sistema operacional.

---

## Passo a Passo para Configurar

### 1. Clonar o Repositório

Abra o terminal e execute os comandos abaixo:

git clone https://github.com/usuario/projeto-docker.git
cd projeto-docker


### 2. Subir os Contêineres

Execute o comando para iniciar todos os serviços:

docker-compose up --build


- **O que está acontecendo aqui?**
  - O Docker Compose vai baixar as imagens necessárias, construir os contêineres e iniciá-los.

### 3. Acessar a Aplicação

- **Frontend**: [http://localhost](http://localhost)
- **Backend 1**: [http://localhost/backend1](http://localhost/backend1)
- **Backend 2**: [http://localhost/backend2](http://localhost/backend2)

---

## Explicação do Projeto

1. O **NGINX** é configurado como **proxy reverso**, redirecionando as requisições recebidas para as duas instâncias do backend.
2. O **frontend React** fornece a interface visual para o usuário.
3. O **backend Flask** realiza as operações e interage com o banco **PostgreSQL** para salvar e recuperar dados.

## Gerenciando os Serviços

### Atualizando o Backend (Flask)

Se você modificar o backend no diretório backend, execute o seguinte comando:


docker-compose up --build backend1 backend2


### Atualizando o Frontend (React)

Se você modificar o frontend no diretório frontend, reconstrua o contêiner:


docker-compose up --build frontend


### Alterando o NGINX

Para atualizar as configurações do NGINX no arquivo `nginx/nginx.conf`, reinicie o contêiner:

docker-compose restart nginx

## Testando o Projeto

1. Abra [http://localhost](http://localhost) no navegador.
2. Verifique se as interações no frontend chegam ao backend.
3. Confirme se os dados estão sendo armazenados corretamente no PostgreSQL.


## Conclusão

Neste projeto, você aprendeu a:

- Configurar um ambiente **fullstack** usando **Docker Compose**.
- Criar um **proxy reverso** com o NGINX.
- Balancear carga entre múltiplas instâncias do backend.
- Integrar um banco de dados PostgreSQL ao backend Flask.

Esse projeto é uma base sólida para aplicações modernas e pode ser expandido para outros contextos!
