Funcionalidade: Login
Como cliente, quero poder acessar minha conta e me manter logado
para que eu possa ver e responder enquetes de forma rápida
 
@pendente
Cenario: Credenciais Válidas
    Dado que o cliente informou credenciais válidas
    Quando solicitar para fazer login
    Entao o sistema deve enviar o usuário para a tela de pesquisa
    E manter o usuário conectado
    Exemplos: 
    |  Razao  | 
    |  Valor 1 | 
    |  Valor 2 | 
 
 @pendente
 Cenario: Credenciais Inválidas
    Dado que o cliente informou credenciais Inválidas
    Quando solicitar para fazer login
    Entao o sistema deve retornar uma mensagem de erro