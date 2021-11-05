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
