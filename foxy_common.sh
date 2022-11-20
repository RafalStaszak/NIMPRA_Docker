xhost +local:root
docker run -it --rm \
	--name=foxy \
	--shm-size=1g \
	--ulimit memlock=-1 \
	--volume="/tmp/.X11-unix:/tmp/.X11-unix" \
	--volume="/home/$SUDO_USER/Nimpra_Shared:/root/Shared:rw" \
	--env="DISPLAY=$DISPLAY" \
	--network=host \
	foxy \
	bash
