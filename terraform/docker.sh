# should also look at installing miniKube and deploying via helm https://docs.localstack.cloud/aws/getting-started/installation/#docker
docker run \
  --rm -it \
  -p 127.0.0.1:4566:4566 \
  -p 127.0.0.1:4510-4559:4510-4559 \
  -v /var/run/docker.sock:/var/run/docker.sock \
  localstack/localstack

  # Docker Desktop > Settings > Resources > Enable integration with other distros, had to do that after moving to ubuntu 22

  # Local stack start via their CLI and no longer above
  
   # localstack config validate