#!/usr/bin/env bash

set -x

env

ssh-add -l || true

ssh -T git@github.com || true

SERVICE_URL=https://open-vsx.org/vscode/gallery ITEM_URL=https://open-vsx.org/vscode/item /var/tmp/coder/code-server/bin/code-server --install-extension ms-python.python --force
