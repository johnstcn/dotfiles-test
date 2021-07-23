#!/usr/bin/env bash

set -x

env

ssh-add -l || true

ssh -T git@github.com || true
