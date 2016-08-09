# Based on: https://gist.github.com/luislobo/2dc3de67b7f2ddc623c239dff36962a0 
# Ask for the user password
# Script only works if sudo caches the password for a few minutes
sudo true

# Get latest docker compose released tag
docker_compose_version="$(git ls-remote https://github.com/docker/compose | grep "refs/tag" | grep -oP "[0-9]+\.[0-9]+\.[0-9]+" | tail -n1)"

echo "Installing version $docker_compose_version"

# Install docker-compose
sudo sh -c "curl -L https://github.com/docker/compose/releases/download/$docker_compose_version/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose"
sudo chmod +x /usr/local/bin/docker-compose
sudo sh -c "curl -L https://raw.githubusercontent.com/docker/compose/$docker_compose_version/contrib/completion/bash/docker-compose > /etc/bash_completion.d/docker-compose"

