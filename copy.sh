#!/bin/bash
while true
do
  # clip.exe should in /mnt/c/windows/system32/clip.exe
  # you can check it by "which clip.exe"
  # this `cat' waits input and then exit after receiving content
  cat /clip | clip.exe
done

