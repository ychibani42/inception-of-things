#!/bin/bash

# Attendre que le server soit prêt
sleep 15

# Récupérer le token depuis le server
TOKEN=$(ssh -o StrictHostKeyChecking=no vagrant@192.168.56.110 'sudo cat /var/lib/rancher/k3s/server/node-token')

# Installation de K3s en mode agent
curl -sfL https://get.k3s.io | K3S_URL=https://192.168.56.110:6443 \
  K3S_TOKEN="$TOKEN" \
  sh -s - agent --node-name=loginSW
