source ~/miniconda3/etc/profile.d/conda.sh
conda activate auto1111

SD_DEVICE=$1
SD_PORT=$((6500+$SD_DEVICE))
LOG_FILENAME="sb_${SD_DEVICE}_${SD_PORT}.log"

PID=$(cat sb_${SD_DEVICE}.pid)
if ps -p $PID > /dev/null
then
   echo "Already running. Killing $PID"
   kill $PID
fi

export PYTHONUNBUFFERED=1
echo "RUNNING python launch.py --xformers --listen --device-id $SD_DEVICE --port $SD_PORT --api --enable-insecure-extension-access --disable-safe-unpickle  &> ./$LOG_FILENAME &"
python launch.py --xformers --listen --device-id $SD_DEVICE --port $SD_PORT --api --enable-insecure-extension-access --disable-safe-unpickle &> $LOG_FILENAME &
echo "Launched with PID $!"
echo $! > sb_${SD_DEVICE}.pid