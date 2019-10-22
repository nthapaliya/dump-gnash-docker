# Compiling dump-gnash in docker

Steps to get this working:

```
git clone https://github.com/nthapaliya/dump-gnash-docker
cd dump-gnash-docker
docker build .
cp dump-gnash ~/.local/bin # Somewhere accessible in $PATH
dump-gnash --version
```

# Problems running the `dump-gnash` wrapper

If you get the error `Unable to find image '3e96d1af60ad:latest' locally`
then you have to to edit `dump-gnash` by changing the docker image id.
Search for it by running `docker image ls`

```
#!/bin/bash

if [[ $1 =~ preview.swf$ ]]; then
  docker run -v /tmp:/tmp 3e96d1af60ad /root/preview.swf "${@:2}"
  #                       ^^ change this
else
  docker run -v /tmp:/tmp 3e96d1af60ad "$@"
  #                       ^^ change this
fi
```
