
Build it
---
```
docker build --build-arg SSH_PRIVATE_KEY1="$(cat ~/.ssh/id_ed25519)" --build-arg SSH_PRIVATE_KEY2="$(cat ~/.ssh/crankiz.key)" -t crankiz/jumpbox:latest .
```
Run it
---
```
docker run -d -p 2222:22 -e SSH_PUBKEY="$(tail -1 ~/.ssh/authorized_keys)" --name jumpbox crankiz/jumpbox:latest
```
Redo it
---
```
ssh-keygen -f "/home/crankiz/.ssh/known_hosts" -R "[10.0.0.100]:2222"
```
