
# TurStar API - Sistema de agência de Viagens

Este projeto é uma API desenvolvida em Ruby On Rails para realizar o gerenciamento de um sistema de agência de viagens. A aplicação fornece endpoints de gerenciamento de usuários, destinos, categorias, reservas e entre outros recursos. 

## Tecnologias utilizadas
- Ruby (**v3.2.9**)
- Rails (**v8.0.4**)
- PostgreSQL
- Docker e Docker Compose
- Postman Collection (**Documentação**)

## Como Executar (com docker)
### 1. Buildar e subir os containers
```bash
docker compose up --build -d
```
### 2. Criar, Migrar e povoar o banco
```bash
docker compose exec rails db:create db:migrate db:seed
```
