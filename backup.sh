#!/usr/bin/env sh

set -x

tarsnap -c -f "dropbox-$(date +%Y-%m-%d)" /docker/
tarsnap -c -f "documents-$(date +%Y-%m-%d)" /documents/
tarsnap -c -f "org-$(date +%Y-%m-%d)" /org/
