#!/usr/bin/env bash

set -x

ssh-add -l || true

ssh -T git@github.com || true
