# Patchwork Docker

## Setup

* clone

  ```
  git clone --recursive https://github.com/juliangaal/patchwork-docker
  ```

* Setup x11:

  ```
  xhost +local:docker
  ```

* Make entrypoint executable

  ```
  chmod +x entrypoint.sh
  ```

* Build docker image

  ```
  docker build -t patchwork .
  ```

* Run

  ```
    docker run -it --privileged --net=host --name patchwork --rm -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY -h $HOSTNAME -v $HOME/.Xauthority:/home/calibrator/.Xauthority -- patchwork
  ```
