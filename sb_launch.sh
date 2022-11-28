export PYTHONUNBUFFERED=1
SD_DEVICE=$1
MODEL_PATH=$2
SD_PORT=$((6500+$SD_DEVICE))
LOG_FILENAME="sb_${SD_DEVICE}_${SD_PORT}.log"
echo "RUNNING python launch.py --xformers --listen --device-id $SD_DEVICE --port $SD_PORT --api --enable-insecure-extension-access --vae-path $MODEL_PATH/improved_faces.vae.pt &> ./$LOG_FILENAME &"
python launch.py --xformers --listen --device-id $SD_DEVICE --port $SD_PORT --api --enable-insecure-extension-access --disable-safe-unpickle --vae-path $MODEL_PATH/improved_faces.vae.pt &> $LOG_FILENAME &
echo "Started with PID $!"