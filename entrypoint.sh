if [ -z $LOCAL_HOST ]; then
  LOCAL_HOST=0.0.0.0
fi

SSH_CMD_OPTIONS="-N -D ${LOCAL_HOST}:3000"
if [ ! -z $DEST_PORT ]; then
  SSH_CMD_OPTIONS="-p ${DEST_PORT} ${SSH_CMD_OPTIONS}"
fi

rm -rf /root/.ssh \
  && mkdir /root/.ssh \
  && cp -R /root/ssh/* /root/.ssh/ \
  && chmod -R 600 /root/.ssh/* \
  && ssh $SSH_CMD_OPTIONS $DEST_USER@$DEST_HOST \
  && while true; do sleep 50; done;
