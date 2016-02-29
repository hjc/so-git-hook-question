#!/bin/sh

bail() {
    echo 'Error executing command, exiting'
    exit 1
}

exec_cmd_nobail() {
    echo "+ $1"
    bash -c "$1"
}

exec_cmd() {
    exec_cmd_nobail "$1" || bail
}


for i in hooks/*; do
  if ! [ -f ".git/${i}" ]; then
     exec_cmd "ln -s $(pwd)/${i} .git/${i}"
  fi
done
