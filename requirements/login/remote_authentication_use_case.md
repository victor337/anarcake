# Remote Authentication Use ase

> ## Caso de sucesso
1. Sistema valida os dados
2. Sistema faz uma requiição para a URL da API de login
3. Sistema valida os dados recebidos da API
4. Sistema entrega os dados da conta do usuário

> ## Exceção - URL inválida
1. Sistema deve retornar uma mensagem de erro inesperado

> ## Exceção - Dados inválidos
1. Sistema deve retornar uma mensagem de dados inválidos

> ## Exceção - Resposta inválida
1. Sistema deve retornar uma mensagem de erro inesperado

> ## Exceção - Falha no servidor
1. Sistema deve retornar uma mensagem de erro inesperado

> ## Exceção - Credenciais inválidas
1. Sistema deve retornar uma mensagem de erro informando credenciais inválidas