(instalar ansible)
sudo apt update
sudo apt install ansible

(generar llave ssh)
ssh-keygen

(clonar repositorio)
git clone https://github.com/upszot/UTN-FRA_SO_Ansible.git

(modificar inventory y playbook)
vim inventory
vim playbook

(ejecutar ansible)
ansible-playbook -i inventory playbook.yml

(conectarse al host y comprobar la instalacion)
ssh vagrant@192.168.56.9
sudo apt list --installed | grep apache
