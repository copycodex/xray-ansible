.PHONY: all init init-close-22 traefik xray xray-add-client ping-init ping export-clients

all:
	ansible-playbook -i $(ANSIBLE_INVENTORY)  playbooks/site.yml

# run initial server setup
init:
	ansible-playbook -i $(ANSIBLE_INVENTORY) playbooks/init.yml

# run initial server setup and close port 22 after switching to new port
init-close-22:
	ansible-playbook -i $(ANSIBLE_INVENTORY) playbooks/init.yml -e close_ssh_22=true

# deploy traefik
traefik:
	ansible-playbook -i $(ANSIBLE_INVENTORY) playbooks/traefik.yml

# deploy xray server
xray:
	ansible-playbook -i $(ANSIBLE_INVENTORY) playbooks/xray.yml

# add new xray client, use NAME=<client_name>
xray-add-client:
	ansible-playbook -i $(ANSIBLE_INVENTORY) playbooks/add-xray-client.yml -e "client_name=$(NAME)"

ping-init:
	ansible-playbook playbooks/ping-init.yml

ping:
	ansible-playbook playbooks/ping.yml

export-clients:
	ansible-playbook -i $(ANSIBLE_INVENTORY) playbooks/xray-export.yml
