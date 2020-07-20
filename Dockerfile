FROM cm2network/steamcmd

ENV METAMOD_VERSION 1.10 \
    SOURCEMOD_VERSION 1.10 \
    MAP "ctf_2fort"

WORKDIR /tf2c

USER root

RUN dpkg --add-architecture i386 \
    && apt update \
    && apt install gdb libsdl2-2.0-0:i386 lib32gcc1 libstdc++6 libstdc++6:i386 libcurl4-gnutls-dev:i386 lib32stdc++6 -y

COPY --chown=steam:steam . .

RUN chmod +x /tf2c/start_server.sh 

USER steam

EXPOSE 27015/udp 27015/tcp 7401 8401

CMD [ "./start_server.sh"]