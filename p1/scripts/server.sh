#!/bin/bash

# Installation de K3s en mode server
curl -sfL https://get.k3s.io | sh -s - server \
  --write-kubeconfig-mode=644 \
  --node-name=loginS \
  --bind-address=192.168.56.110 \
  --advertise-address=192.168.56.110

# Attendre que K3s soit prêt
sleep 10

# Vérifier que K3s est actif
sudo systemctl status k3s
