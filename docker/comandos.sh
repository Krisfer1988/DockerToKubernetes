##############################################
#     Instalación de docker
##############################################
sudo apt install docker              
docker --version
docker version
systemctl status docker
sudo systemctl restart docker

##############################################
#     Instalación de docker-compose
##############################################
sudo apt install docker-compose -y
docker-compose --version

##############################################
#     Operaciones sobre imágenes
##############################################
docker image list                   # Mostrar todas las imágenes
docker images -q                    # Mostrar ids de las imágenes
docker image rm AAB18973            
docker rmi $(docker images -q)
docker search nginx                 # Buscar una imagen en un repo
docker pull nginx                   # Descargar imagen

##############################################
#     Creación de contenedores
##############################################
docker container create nginx
docker container create --name minginx nginx
docker container create --name minginx -v /home/ubuntu/environment:/curso nginx
docker container create --name minginx -v /home/ubuntu/environment/curso/proxy/nginx.conf:/etc/nginx/nginx.conf nginx
# Creación de un contenedor desde una imagen, configurando puertos, volúmenes y nombre
docker container create --name minginx -v /home/ubuntu/environment/curso/proxy/nginx.conf:/etc/nginx/nginx.conf -p 8080:8080 -p 8081:8081 -p 8082:8082 nginx

##############################################
#     Operaciones sobre contenedores
##############################################
docker container list
docker container list --all # Mostrar todos los contenedores, incluyendo los parados
docker ps
docker ps --all

docker inspect minginx                  # Mostrar propiedades de un contenedor
docker inspect minginx | grep IPA

docker exec -it minginx bash            # Ejecutar comando dentro de un contenedor
docker exec minginx ls -l /etc/nginx

docker rm cbf571b81f79
docker rm minginx
docker container rm minginx
docker rm minginx -f                    # Borrar un contenedor aunque esté corriendo

docker start minginx                    # Arrancar contenedor
docker stop minginx
docker restart minginx

docker logs minginx                     # Consultar logs del contenedor

##############################################
#     Operaciones con docker-compose
##############################################
docker-compose up                       # Crear los contenedores de un fichero docker-compose.yml y arrancarlos
docker-compose up -d                        # en segundo plano
docker-compose stop                     # Parar los contenedores definidos en un docker-compose.yml
docker-compose down                     # Pararlos y borrarlos
