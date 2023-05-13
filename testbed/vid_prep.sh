#!/bin/bash

echo "Prepping bbb1.mp4"
sudo ffmpeg -i bbb1.mp4 -hide_banner
sudo ffmpeg -i bbb1.mp4 -t 00:02:00 bbb1_2m.mp4

sudo x264 --output bbb_500k.264 --fps 30 --preset slow --bitrate 500 --vbv-maxrate 1000 --vbv-bufsize 2000 --min-keyint 96 --keyint 96 --scenecut 0 --no-scenecut --pass 1 --video-filter resize:width=1280,height=720 bbb1.mp4
sudo x264 --output bbb_2400k.264 --fps 30 --preset slow --bitrate 2400 --vbv-maxrate 4800 --vbv-bufsize 9600 --min-keyint 96 --keyint 96 --scenecut 0 --no-scenecut --pass 1 --video-filter resize:width=1280,height=720 bbb1.mp4
sudo x264 --output bbb_5000k.264 --fps 30 --preset slow --bitrate 1000 --vbv-maxrate 2000 --vbv-bufsize 4000 --min-keyint 96 --keyint 96 --scenecut 0 --no-scenecut --pass 1 --video-filter resize:width=1280,height=720 bbb1.mp4

sudo MP4Box -add bbb_5000k.264 -cat bbb_2400k.264 -cat bbb_500k.264 -fps 30 bbb_all.mp4
sudo MP4Box -dash 4000 -frag 4000 -rap -segment-name segment_2400k_ bbb_all.mp4
