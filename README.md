#Versão de software:

Docker version 18.09.9-ce

ansible 2.8.5

Terraform v0.11.14

packer 1.4.5

# Teste

Instalar docker + docker-compose + python-pip

Clonar o repositório e executar dentro do diretório raiz:
docker-compose up -d

Acessar no navegador e checar a aplicação


# Deploy AWS
Criar usuário com devidas permissões via IAM.

Criar variáveis ambiente no SO, com os dados de acesso:
export AWS_ACCESS_KEY_ID=”<Access key ID>”
export AWS_SECRET_ACCESS_KEY=”<Secret access key>”

Instalar packer e terraform nas versões aqui listadas.

Executar:

packer validate quero.json
packer build quero.json

Após término da execução, capturar AMI_ID gerada, e atualizar o arquivo buildQuero.tf .

Executar:

terraform init
terraform apply

Acessar instância criada via navegador, e utilizar a aplicação.
