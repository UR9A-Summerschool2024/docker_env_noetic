This is the setup-branch for linux hosts.

## Setup instuctions

### Docker

Install the [docker engine](https://docs.docker.com/engine/install/ubuntu/) and follow [the post installation steps](https://docs.docker.com/engine/install/linux-postinstall/) and test if you can run the hello-world example without sudo.

Here are some commands needed to interfere with docker:
```bash
docker compose build # builds the docker image
docker compose up -d # starts docker container using the image in the background (-d)
docker compose stop  # shuts down the container
docker docker exec -it ros-env-summerschool bash # connects your terminal session to the container
```

You might want to export some alias to attach in interactive terminal session to your container, i.e.
```bash
alias dcexec="docker exec -it ros-env-summerschool bash"
```
This way you can attach to the container by executing
```bash
dcexec  # docker compose exec -it keiko-ros-env: starts interactive terminal session with container
```

Note that the string *ros-env-summerschool* is the name of your container as defined in the docker-compose.yaml.

#### Optional: Install zsh 

I (Henrik) would recommend to install zsh as I think it makes developing more convenient

```bash
sudo apt install -y zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

sudo sed -i 's/ZSH_THEME=.*/ZSH_THEME="spaceship"/' ~/.zshrc # Theme
sudo sed -i 's/plugins=.*/plugins=(git docker docker-compose)/' ~/.zshrc # adds some nice aliases
```

So you can use these nice aliases to interfere with your container:
```bash
dcb     # docker compose build: builds the docker image
dcupd   # docker compose up -d: starts docker container using the image in the background (-d)
dcexec  # docker compose exec -it keiko-ros-env: starts interactive terminal session with container
dcstop  # docker compose stop: shuts down the container

```

### GUI access using X11 forwarding
To access gui applications like rviz, gazebo, matplotlib windows, etc. you have to add the following environment variable to your
~/.bashrc or ~/.zshrc file

```bash
sudo echo 'xhost +local:docker &> /dev/null11' >> ~/.zshrc 
```
