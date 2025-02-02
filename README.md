# e-commerce-api

## Descrição do Projeto

Este projeto foi desenvolvido com fluxo de compra online, visualização de relatório de vendas e permissões de acesso de forma hierárquica, com visualização diferenciada para administradores e colaboradores.

## Funcionalidades Implementadas

- **Tela de Login e Cadastro**: Permite que os usuários façam login ou criem uma nova conta para acessar o sistema.
- **Home Page de Visualização de Produtos**: Área para visualizar os produtos cadastrados.
- **Visualização Hierarquizada de Perfis e Permissões**: Implementação de diferentes níveis de acesso (admin e colaborador) com base nas permissões configuradas.
- **Relatório de Vendas**: Área para visualização e extração de relatórios de vendas. **A opção de download/export do relatório está visível apenas para usuários com perfil de admin**.
- **Área de Importação de Produtos**: Implementação da funcionalidade de importação de produtos na api, embora a parte final da estrutura de importação ainda não tenha sido concluída devido ao tempo.

## Link de Hospedagem do Projeto

- [https://e-commerce-api-upjq.onrender.com](https://e-commerce-api-upjq.onrender.com)

### Sugestão de Login

Para acessar, utilize o login abaixo com perfil de Admin:

- **Email**: test@gmail.com
- **Senha**: 1234567

Alternativamente, você também pode criar um novo login.

Obs.: O servidor de hospedagem utilizado (Render) pode levar um tempo para responder à primeira requisição após um período de inatividade. Isso ocorre porque os contêineres ficam inativos durante o tempo sem uso e precisam ser reativados (automaticamente) quando uma nova requisição é feita. Esse comportamento é uma limitação do plano gratuito, que restringe os recursos disponíveis.
