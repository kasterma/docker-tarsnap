#!/usr/bin/env sh

set -x

tarsnap -c -f "XXdropbox-$(date +%Y-%m-%d)" /docker/
tarsnap -c -f "XXdocuments-$(date +%Y-%m-%d)" /documents/
tarsnap -c -f "XXorg-$(date +%Y-%m-%d)" /org/
