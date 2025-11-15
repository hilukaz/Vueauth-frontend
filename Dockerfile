#pega uma imagem existente, pesquisar no dockerhub
FROM node:18

# defino o diretório no qual o container estará
WORKDIR /home/app

#pega um arquivo do diretório e copia ele dentro do docker no caminho selecionado
COPY package*.json ./

# executa um comando cmd no container 
RUN npm install 

COPY . .

# executa um comando quando o container estiver inicializado
CMD ["npm", "run","serve"]

#expõe a porta na qual está rodando sua aplicação
EXPOSE 8080

#comandos docker cmd
#builda o docker e define o nome e a versão do projeto
#docker build -t frontend-app:1.0 .

#CONSTROI um container 
#docker run frontend-app:1.0

#roda um container 
#docker start frontend-app:1.0

#constroi o docker com mapeamento de porta
#docker roda na 9000, aplicação roda na 8080
#docker run -p 9000:8080 frontend-app:1.0

#Rodar detached com mapeamento de porta
#docker run -d -p 9000:8080 frontend-app:1.0


#lista todos os docker
#docker ps -a

#deleta o container
#docker rm <container>

#deleta o nome da imagem que criou
#docker rmi <images>

#para um container em execução
#docker stop <container>

#inicia um container que está parado
#docker start <container>

#executar um comando dentro de um container em execução
#docker exec -it <container> bash

#rebuild
#docker build --no-cache -t frontend-app:1.0 .
