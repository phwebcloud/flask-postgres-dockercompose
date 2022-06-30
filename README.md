# Versão de software:

Docker version 20.10.16

ansible 2.9.27

Terraform v1.2.3

packer 1.8.2

# Teste

Instalar docker + docker-compose + python-pip

Clonar o repositório e executar dentro do diretório raiz:

```bash
docker-compose up -d
``` 

Acessar no navegador e checar a aplicação


# Deploy AWS
Criar usuário com devidas permissões via IAM.

Criar variáveis ambiente no SO, com os dados de acesso:
```bash
export AWS_ACCESS_KEY_ID=”<Access key ID>”
export AWS_SECRET_ACCESS_KEY=”<Secret access key>”
```

Instalar packer e terraform nas versões aqui listadas.

Executar:

```bash
packer validate packer.json
packer build packer.json
```

Após término da execução, capturar `AMI_ID` gerada, e atualizar o arquivo main.tf .

Executar:

```bash
terraform init
terraform apply
```

Acessar instância criada via navegador, e utilizar a aplicação.
