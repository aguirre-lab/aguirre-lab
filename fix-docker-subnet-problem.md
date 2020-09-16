Sometimes a machine at MGH cannot connect to another machine. This is due to Docker’s preset subnet IP `172.17.0.0/16`

Add a config file at `/etc/docker/daemon.json` with the following body:

```
{
     "bip": "172.25.1.1/16",
     "ipv6": false,
     "fixed-cidr": "172.25.1.1/24"
}
```

If `172.25.` prefix is also in use, choose another subnet.

Save the config and restart docker with:

```
sudo systemctl restart docker
```
