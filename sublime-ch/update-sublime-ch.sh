#!/bin/sh

bin=`dirname "$0"`
bin=`cd "$bin">/dev/null; pwd`

if [ ! -f "$bin/sublime-imfix.c" ];then
    echo "cannot find sublime-imfix.c, ERROR!"
    exit
fi

gcc -shared -o $bin/libsublime-imfix.so $bin/sublime-imfix.c `pkg-config --libs --cflags gtk+-2.0` -fPIC

if [ ! -f "$bin/libsublime-imfix.so" ];then
    echo "build [sublime-imfix.c] error, exit!"
    exit
fi

sudo mv $bin/libsublime-imfix.so /opt/sublime_text/

if [ ! -f "$bin/subl" ];then
    echo "cannot find replaced subl file, exit!"
    exit
fi

sudo cp $bin/subl /usr/bin/

if [ ! -f "$bin/sublime_text.desktop" ];then
    echo "cannot find replaced sublime_text.desktop file, exit!"
    exit
fi

sudo cp $bin/sublime_text.desktop /usr/share/applications/
