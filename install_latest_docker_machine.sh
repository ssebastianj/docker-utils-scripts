# Based on: https://gist.github.com/luislobo/2dc3de67b7f2ddc623c239dff36962a0 
# Ask for the user password
# Script only works if sudo caches the password for a few minutes
sudo true

# Get latest docker machine released tag
docker_machine_version="$(git ls-remote https://github.com/docker/machine | grep "refs/tag" | grep -oP "v[0-9]+\.[0-9]+\.[0-9]+" | tail -n1)"

echo "Installing version $docker_machine_version"

# Install docker-machine
sudo sh -c "curl -L https://github.com/docker/machine/releases/download/$docker_machine_version/docker-machine-`uname -s`-`uname -m` > /usr/local/bin/docker-machine"
sudo chmod +x /usr/local/bin/docker-machine

