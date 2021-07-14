#!/usr/bin/env bash

set -x

ssh-add -l

ssh -T git@github.com
