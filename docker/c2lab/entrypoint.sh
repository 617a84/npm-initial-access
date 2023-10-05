#!/usr/bin/env bash
set -x
# entrypoint script

/usr/bin/tmux new-session -d -s c2 'bash setup_and_run_remote.sh'

exec "$@"