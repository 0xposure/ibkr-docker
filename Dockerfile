FROM ghcr.io/extrange/ibkr:latest

RUN apt-get update && apt-get install -y lsof

COPY check-port.sh ./
RUN chmod a+x check-port.sh

CMD [ "./start.sh" ]