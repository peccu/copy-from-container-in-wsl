# copy from docker container in WSL

based on https://stackoverflow.com/a/63719458.

## Usage

after setup, you can use the copy in container by volumes.

```
$ sudo docker run -it -v /clip:/clip alpine sh
/ # date > /clip
```

you can set alias for copy

```bash
/ # alias C='cat - > /clip'
/ # date | C
```


## setup

- create pipe
- put script for copy loop with clip.exe
- setup crontab

### create pipe

```bash
[ -p /clip ] && echo already exists the pipe for copy || sudo mkfifo /clip
```

### put script

copy script in this repo into where you want and add exec permission.

script is like this.

```bash
#!/bin/bash
while true
do
  # clip.exe should in /mnt/c/windows/system32/clip.exe
  # you can check it by "which clip.exe"
  # this `cat' waits input and then exit after receiving content
  cat /clip | clip.exe
done
```

### setup crontab

edit crontab by `crontab -e` and put below.

```bash
@reboot /path/to/copy.sh
```

