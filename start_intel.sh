if [ -z "$SUDO_USER" ]
then
      user=$USER
else
      user=$SUDO_USER
fi

xhost +local:root
docker run -it --rm \
	--name=jazzy \
	--shm-size=1g \
	--ulimit memlock=-1 \
	--volume="/tmp/.X11-unix:/tmp/.X11-unix" \
	--volume="/home/$user/Shared:/root/Shared:rw" \
	--device=/dev/dri:/dev/dri \
	--device=/dev/video0 \
	--env="DISPLAY=$DISPLAY" \
	--network=host \
	jazzy \
	bash
