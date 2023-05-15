#!/bin/bash

echo "Prepping bbb1.mp4"
sudo ffmpeg -i bbb1.mp4 -hide_banner
sudo ffmpeg -i bbb1.mp4 -t 00:02:00 bbb1_2m.mp4

sudo x264 --output bbb_600k.264 --fps 30 --preset slow --bitrate 600 --vbv-maxrate 1200 --vbv-bufsize 2400 --min-keyint 96 --keyint 96 --scenecut 0 --no-scenecut --pass 1 --video-filter resize:width=1280,height=720 bbb1.mp4
sudo MP4Box -add bbb_600k.264 -fps 30 bbb_600k.mp4
sudo MP4Box -dash 4000 -frag 4000 -rap -segment-name segment_600k_ bbb_600k.mp4

sudo x264 --output bbb_2400k.264 --fps 30 --preset slow --bitrate 2400 --vbv-maxrate 4800 --vbv-bufsize 9600 --min-keyint 96 --keyint 96 --scenecut 0 --no-scenecut --pass 1 --video-filter resize:width=1280,height=720 bbb1.mp4
sudo MP4Box -add bbb_2400k.264 -fps 30 bbb_2400k.mp4
sudo MP4Box -dash 4000 -frag 4000 -rap -segment-name segment_2400k_ bbb_2400k.mp4

sudo x264 --output bbb_1200k.264 --fps 30 --preset slow --bitrate 1200 --vbv-maxrate 2400 --vbv-bufsize 4800 --min-keyint 96 --keyint 96 --scenecut 0 --no-scenecut --pass 1 --video-filter resize:width=1280,height=720 bbb1.mp4
sudo MP4Box -add bbb_1200k.264  -fps 30 bbb_1200k.mp4
sudo MP4Box -dash 4000 -frag 4000 -rap -segment-name segment_1200k_ bbb_1200k.mp4

sudo cp bbb_600k.mpd bbb_all.mpd
sudo cp bbb_2400k.mpd bbb_all.mpd
sudo cp bbb_1200k.mpd bbb_all.mpd