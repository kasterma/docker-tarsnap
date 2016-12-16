build:
	mkdir -p files
	if [ ! -e files/tarsnap-autoconf-1.0.37.tgz ]; then \
	  cd files && curl --remote-name https://www.tarsnap.com/download/tarsnap-autoconf-1.0.37.tgz ; \
	fi
	hash="$$(sha256sum files/tarsnap-autoconf-1.0.37.tgz | awk '{ print $$1 }')"; \
	echo $$hash; \
	if [ "$${hash}" != "fa999413651b3bd994547a10ffe3127b4a85a88b1b9a253f2de798888718dbfa" ]; then \
	  echo "ERROR ERROR ERROR: sha incorrect"; \
		rm files/tarsnap-autoconf-1.0.37.tgz; \
	fi
	docker build -t kasterma/tarsnap .

clean:
	rm -rf files

backup:
	docker run \
	-v /usr/local/tarsnap-cache:/tarsnap-cache \
	-v /Users/kasterma/tarsnap.key:/tarsnap.key:ro \
	-v /Users/kasterma/Dropbox/:/dropbox:ro \
	-v /Users/kasterma/Documents/:/documents:ro \
	-v /Users/kasterma/org/:/org:ro \
	-v /Users/kasterma/notes/:/notes:ro \
	--rm kasterma/tarsnap
