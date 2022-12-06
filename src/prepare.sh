#!/bin/bash
mkdir -p src/binary
dd if=/dev/zero of=./src/binary/serv bs=1G count=1 # easter egg, for attentive
