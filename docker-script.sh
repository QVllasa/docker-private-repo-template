sudo docker run -d --name registry --restart=always \
     -p 443:5000 -e REGISTRY_HTTP_ADDR=0.0.0.0:5000 \
     -e REGISTRY_HTTP_TLS_CERTIFICATE=/etc/letsencrypt/live/registry.yourdomain.com/fullchain.pem \
     -e REGISTRY_HTTP_TLS_KEY=/etc/letsencrypt/live/registry.yourdomain.com/privkey.pem \
     -e REGISTRY_AUTH=htpasswd \
-e REGISTRY_STORAGE_DELETE_ENABLED=true \
     -e REGISTRY_AUTH_HTPASSWD_REALM="Docker Registry Realm" \
     -e REGISTRY_AUTH_HTPASSWD_PATH=/htpasswd \
     -v /etc/letsencrypt:/etc/letsencrypt \
     -v /var/lib/docker/registry:/var/lib/registry \
     -v ~/.htpasswd:/htpasswd \
     registry:2
