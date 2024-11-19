(crear carpetas y archivos)
mkdir docker2Parcial

mkdir appHomeBanking
cat > index.html
cat > contacot.html

(crear y editar dockerfile)
cat > dockerfile
vim dockerfile

(construir imagen de docker)
docker build -t santiagovallina/2parcial-ayso:v1.0 .

(subir imagen a dockerhub)
docker push santiagovallina/2parcial-ayso:v1.0

(desplegar aplicacion)
docker run -d -p 8080:80 santiagovallina/2parcial-ayso:v1.0

(links)
http://192.168.56.3:8080/index.html
http://192.168.56.3:8080/contacto.html
