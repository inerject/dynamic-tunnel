SSH_SRC_DATA=/root/ssh
SSH_DEST_DATA=/root/.ssh

if [ -z $LOCAL_HOST ]; then
  LOCAL_HOST=0.0.0.0
fi

SSH_CMD_OPTIONS="-N -D ${LOCAL_HOST}:3000"

if [ ! -z $DEST_PORT ]; then
  SSH_CMD_OPTIONS="-p ${DEST_PORT} ${SSH_CMD_OPTIONS}"
fi

if [ ! -z $IDENTITY_FILE ]; then
  SSH_CMD_OPTIONS="-i ${SSH_DEST_DATA}/${IDENTITY_FILE} ${SSH_CMD_OPTIONS}"
fi

rm -rf ${SSH_DEST_DATA} \
  && mkdir ${SSH_DEST_DATA} \
  && cp -R ${SSH_SRC_DATA}/* ${SSH_DEST_DATA}/ \
  && chmod -R 600 ${SSH_DEST_DATA}/* \
  && ssh $SSH_CMD_OPTIONS $DEST_USER@$DEST_HOST \
  && while true; do sleep 50; done;
