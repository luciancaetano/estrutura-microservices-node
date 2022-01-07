# Tecnologias utilizadas

Este projeto está inteiramente desenvolvido em typescript utilizando do yarn workspaces e lerna para a organização do monorepo.
No back-end foi utilizado a biblioteca `express` e `typeorm`
No front-end foi utilizado `react`, `redux` e `axios`.

## Pré requisitos
- Yarn com o seguinte comando `npm install -g yarn`
- Instale o postgress e configure o usuário e crie um banco de dados com o nome de `nfe-processamento`
- Você pode importar a estrutura do banco ou permitir que o TypeOrm gere a estrutura para você automaticamente.

#### Configurando Acesso ao banco de dados

O acesso ao banco de dados é feito todo por variáveis de ambiente as quais são.

- ``DB_HOST``: Host do banco de dados, o valor padrão é `localhost`
- ``DB_PASSWORD``: Senha do banco de dados, o valor padrão é `postgres`
- ``DB_USERNAME``: Usuário do banco de dados, o valor padrão é `postgres`

## Instalando pacotes e rodando o projeto
Para instalar o pacotes você deve estar na pasta raiz do projeto e rodar o comando `yarn install` este por sua vez executará a instalação dos pacotes lerna em seguida fará o processo de link de dependências do pacotes.

Para iniciar o projeto execute o seguinte comando `yarn start` executando todos os serviços ao mesmo tempo.

# Estrutura
O projeto organiza-se em um monorepo nodejs dentro da pasta packages

- eslint-config: Neste projeto encontra-se as configurações do eslint compartilhada por todos os outros projetos
- nfe-front-service: Este é o microfront-end do projeto nele consta uma documentação relacionada a estrutura do mesmo, [README.md Front](./packages/nfe-front-service/README.md)
- nfe-process-service: Este projeto cuida do processamento dos arquivos xml localizados na pasta storage na raiz do monorepo.
- nfe-upload-service: Este projeto cuida do processo de upload dos arquivos xml na pasta storage na raiz do projeto.

## Funcionamento do nfe-upload-service
Este projeto finalidade única de receber os arquivos xml e coloca-los na pasta input os quais aguardam o nfe-process-service.

## Funcionamento do nfe-process-service
Este projeto executa uma varedura na pasta `storage/inpurts` periodicamente (`Visite o arquivo nfe-process-service/src/jobs/processa-nfe.ts` e procure pela constante AWAIT_INVERVAL para confirar este intervalo) este por sua vez insere no banco o mesmo em seguida executa o processamento e procede nos casos.
- Erro: Move o arquivo para a pasta `storage/error` e atualiza o status para erro no banco de dados
- Sucesso: Move os arquivos para a pasta `storage/output` e atualiza o status para processado no banco de dados