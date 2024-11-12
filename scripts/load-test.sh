#!/bin/bash

for i in {1..100}; do
  curl -s http://foo.localhost > /dev/null &
  curl -s http://bar.localhost > /dev/null &
  sleep 0.1
done
