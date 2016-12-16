#!/usr/bin/env sh

set -x

tarsnap -c -f "dropbox-$(date +%Y-%m-%d-%H-%M)" /dropbox/
tarsnap -c -f "documents-$(date +%Y-%m-%d-%H-%M)" /documents/
tarsnap -c -f "org-$(date +%Y-%m-%d-%H-%M)" /org/
tarsnap -c -f "notes-$(date +%Y-%m-%d-%H-%M)" /notes/
