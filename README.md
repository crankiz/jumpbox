

```
docker build --build-arg SSH_PRIVATE_KEY="$(cat ~/.ssh/id_ed25519)" -t crankiz/jumpbox:latest .
```
```
docker run -d -p 2222:22 -e SSH_PUBKEY="<public key>" --name jumpbox crankiz/jumpbox:latest
```
