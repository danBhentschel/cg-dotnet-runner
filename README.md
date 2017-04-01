# cg-dotnet-runner
The source for the docker runner used in the CodinGame LINQ (and others?) lesson

## To build

`docker build -t "danbhentschel/cg-dotnet-runner:<version>" .`

## To test

`docker run --rm -v <project_dir>:/project/target --entrypoint="/test.sh" "danbhentschel/cg-dotnet-runner:<version>" <class_name>`

## To push to Docker Hub

`docker push "danbhentschel/cg-dotnet-runner:<version>"`


### Installing docker in an Ubuntu LXC container
```
lxc launch ubuntu-daily:16.04 docker -p default -p docker
lxc exec docker -- apt install docker.io -y
lxc exec docker bash
```
