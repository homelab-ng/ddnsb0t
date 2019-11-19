#!/usr/bin/env bash

function deploy(){
  gcloud functions deploy ddns \
    --trigger-http \
    --region=us-east4 \
    --runtime=go111 \
    --entry-point UpdateDDNS \
    --project=homelab-ng \
    --service-account=ddns-function@homelab-ng.iam.gserviceaccount.com \
    --memory=128Mi \
    --set-env-vars API_TOKEN=${1},DEFAULT_DOMAIN="home.pulsifer.ca."
}

deploy "${1}"
