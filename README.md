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

For a fully working example, please install Git and Vagrant and run following commands:


```bash
git clone https://github.com/vfarcic/docker-sync.git
cd docker-sync
vagrant up
vagrant ssh destination
# Create SSH keys. Answer with the ENTER key to all questions
ssh-keygen
exit

vagrant ssh source
sudo su -
# Create SSH keys. Answer with the ENTER key to all questions
ssh-keygen
# Copy SSH keys from the destination machine. Password is vagrant
ssh-copy-id vagrant@10.101.199.202
exit
mkdir /tmp/my_files
touch /tmp/my_files/my_file /tmp/my_files/my_another_file
# Run vfarcic/sync container
sudo docker run -d --name sync \
  -v /root/.ssh:/root/.ssh \
  -v /tmp/my_files:/data \
  -e DESTINATION_HOST=vagrant@10.101.199.202 \
  -e DESTINATION_DIR=/tmp/my_files \
  vfarcic/sync
exit

# Verify that the files were copied to the destination server
# It might take up to few minutes until the files are transferred
vagrant ssh destination
ll /tmp/my_files
```