# Tarsnap docker

Put tarsnap in a docker.

    make backup
    docker run -v /Users/kasterma/tarsnap.key:/tarsnap.key:ro -v /usr/local/tarsnap-cache:/tarsnap-cache --rm kasterma/tarsnap tarsnap --print-stats

# On OS X

On OS X you must add some files to file sharing.

    /usr/local/tarsnap-cache
