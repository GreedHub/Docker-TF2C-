#!/bin/bash

InstallSdk(){
    mkdir -p /home/steam/tf2c \
    && cd /home/steam/steamcmd/ \
    && ./steamcmd.sh +login anonymous +force_install_dir /home/steam/tf2c +app_update 244310 +quit 
}

runTF2C(){
    cd /home/steam/tf2c/bin \
    && ln -f -s datacache_srv.so datacache.so \
    && ln -f -s dedicated_srv.so dedicated.so \
    && ln -f -s engine_srv.so engine.so \
    && ln -f -s materialsystem_srv.so materialsystem.so \
    && ln -f -s replay_srv.so replay.so \
    && ln -f -s scenefilecache_srv.so scenefilecache.so \
    && ln -f -s shaderapiempty_srv.so shaderapiempty.so \
    && ln -f -s studiorender_srv.so studiorender.so \
    && ln -f -s vphysics_srv.so vphysics.so \
    && ln -f -s soundemittersystem_srv.so soundemittersystem.so
    cd /home/steam/tf2c \
    && ./srcds_run -console -game tf2classic +map $MAP +maxplayers 24
}

DIR="/home/steam/tf2c"

#if [ -d "$DIR" ]; then
  echo "installing"
  InstallSdk
#fi

runTF2C
