docker build -p 2222:22 --build-arg SSH_PRIVATE_KEY="$(cat ~/.ssh/id_ed25519)" -t sample-project . -e SSH_PUBKEY="<public key>"
