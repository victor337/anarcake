Feature: Login
Como um cliente
Quero poder acessar minha conta e me manter logado
Para que eu possa solicitar pedidos com mais agilidade

Cenário: Credenciais Válidas
Dado que o cliente informou Credenciais Válidas
Quando solicitar para fazer login
Então o sistema deve enviar o usuário para a tela principal
E manter o usuário conectado

Cenário: Credenciais Inválidas
Dado que o cliente informou credenciais Inválidas
Quando solicitar para fazer login
Então o sistema deve retornar umamessagem de erro