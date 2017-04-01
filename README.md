# cg-dotnet-runner
The source for the docker runner used in the CodinGame C# LINQ for Beginners (and others?) lesson

This runner executes a C# unit test compiled for .NET Core, and reports on the result. Features include:

 - Highlights compile errors in the source code based on build output
 - Buffers up build and execution output and shoves it to a "RAW OUTPUT" section at the bottom of the results screen
 - Passes through any CG> command lines (not buffered) from the program execution
 - Displays "Building ... Done" while the build is running

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
