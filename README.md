# Docker with multipass on macOS

# Prerequisites

```bash
$ brew install multipass
```

# Usage

This will create and launch an instance called primary. Multipass by default will mount your `$HOME` directory if the instance is named `primary`.

```bash
$ ./create-and-init.sh
+ MEM=2048M
+ CPUS=2
+ DISK=20G
+ echo 'Creating and launching instance'
Creating and launching instance
+ multipass launch --name primary -c 2 -m 2048M -d 20G --cloud-init cloud-init.yml
Launched: primary
Mounted '/Users/chrisgoffinet' into 'primary:Home'
+ echo 'Mounting /Users/chrisgoffinet into remote instance: primary'
Mounting /Users/chrisgoffinet into remote instance: primary
+ multipass mount /Users/chrisgoffinet primary:/Users/chrisgoffinet
++ multipass info primary
++ grep IPv4
++ awk '{split($0,a," "); print a[2]}'
+ PRIMARY_INSTANCE=192.168.64.13
+ echo 'Success! in your bash profile add this:'
Success! in your bash profile add this:
+ echo 'export DOCKER_HOST=tcp://192.168.64.13:2375'
export DOCKER_HOST=tcp://192.168.64.13:2375
```

Now that your `DOCKER_HOST` is pointed to your `primary` instance running commands like you normally do should just work as expected.

```bash
$ docker pull busybox
Using default tag: latest
latest: Pulling from library/busybox
8ba530ca112c: Pull complete
Digest: sha256:15e927f78df2cc772b70713543d6b651e3cd8370abf86b2ea4644a9fba21107f
Status: Downloaded newer image for busybox:latest
docker.io/library/busybox:latest
$ docker images
REPOSITORY   TAG       IMAGE ID       CREATED      SIZE
busybox      latest    cc54699a1d7e   8 days ago   1.41MB
$ echo 'test 123' > test.txt
$ docker run --rm -it -v $PWD/test.txt:/test.txt busybox sh
/ # cat /test.txt
test 123
/ #
```

## How do I configure disk, memory, and cpu?

You can configure the variables in the `create-and-init.sh` script.

```
MEM=2048M
CPUS=2
DISK=20G
```

## How do I shell into the instance?

```bash
$ multipass shell
```
