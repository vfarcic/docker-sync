This container implements a simple files synchronization using [lsyncd](https://code.google.com/p/lsyncd/).

Following environment variables can be used:
* DESTINATION_HOST: Mandatory variable that points to the destination. If only IP is specified, root user will be used. To use a specific user use USER@IP format.
* DESTINATION_DIR: Defaults to /data and represent a directory where files will be synchronized on the destination host.

SSH keys needs to be created and used as a volume. Following example would sync files from the directory **/tmp/something** to the same directory on the **10.101.199.202** machine. User **vagrant** will be used. SSH keys are located in the **/root/.ssh** directory.

```bash
sudo docker run -d --name sync \
  -v /root/.ssh:/root/.ssh \
  -v /tmp/something:/data \
  -e DESTINATION_HOST=vagrant@10.101.199.202 \
  -e DESTINATION_DIR=/tmp/something \
  vfarcic/sync
```

For a fully working example, please install Vagrant and run following commands:


```bash
vagrant up
vagrant provision

vahrant ssh sync-02
ssh-keygen
exit

vahrant ssh sync-01
ssh-keygen
ssh-copy-id sync-02 # Pass: vagrant
sudo apt-get update
sudo apt-get install -y lsyncd
mkdir /tmp/something
lsyncd -nodaemon -rsyncssh /tmp/something vagrant@sync-02 /tmp/something


sudo docker run -d --name sync \
  -v /root/.ssh:/root/.ssh \
  -v /tmp/something:/data \
  -e DESTINATION_HOST=vagrant@10.101.199.202 \
  -e DESTINATION_DIR=/tmp/something \
  vfarcic/sync
```