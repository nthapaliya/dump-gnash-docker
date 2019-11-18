# Compiling dump-gnash in docker

Steps to get this working:

Clone the repo:
```bash
git clone https://github.com/nthapaliya/dump-gnash-docker
cd dump-gnash-docker
```

Build the image:
```bash
docker build -t dump-gnash .
```

Copy the bash wrapper:
```bash
cp dump-gnash ~/.local/bin # Somewhere accessible in $PATH
```

Check if it works!
```bash
dump-gnash --version
```
