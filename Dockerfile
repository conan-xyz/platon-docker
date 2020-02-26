FROM zonzpoo/platon-node:0.9.0-release

ADD entrypoint.sh .
RUN chmod +x ./entrypoint.sh

ENTRYPOINT [ "./entrypoint.sh" ]