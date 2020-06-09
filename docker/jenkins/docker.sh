docker pull jenkins/jenkins:lts
docker container create \
    --name mijenkins \
    -v /home/ubuntu/environment/curso/docker/jenkins/data:/var/jenkins_home \
    -p 8080:8080 \
    jenkins/jenkins:lts
docker start mijenkins