# Debugging Docker Containers

In the event that a container does not perform in the way anticipated, debug it by entering the shell:

```
$ docker run -it  my/package sh
```
 
The _sh_ argument will drop you cleanly into a shell which will allow debugging of the container.

Once in the shell, you can preform the following steps to re-create the startup cycle:

```
# export HAB_PKG=$(cat /.hab_pkg)
# export PKG_PATH=$(hab pkg path $HAB_PKG)
# ./init.sh start $HAB_PKG
^C
# cd $PKG_PATH
# ...
```

## Configuration 

Configuration is dynamically generated by the _hab-sup_ supervisor.  Use _find_ to locate the package configuration
file and template.  Here you can make changes without rebuilding the package.

It is also useful to volume map the configuration directory for Habitats generated config to a local disk to allow
it to more easily be viewed, eg:

```
$ mkdir lighttpd-config
$ docker run -it \
> -v ~/public_html:/hab/svc/lighttpd/data \
> -v ~/lighttpd-config:/hab/svc/lighttpd/config \
> chefops/lighttpd
```

Once the supervisor runs and generates the config, you can easily view it in the locally mapped directory.





