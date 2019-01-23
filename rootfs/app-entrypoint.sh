#!/bin/bash

set -o errexit
set -o pipefail

# Load libraries
. /opt/samyamashita/base/functions

is_gems_updated() {
  bundle check 1> /dev/null
}

# if [[ "$1" = "bundle" ]] && [[ "$2" = "exec" ]]; then
#   if ! is_gems_updated; then
#     log "Installing/Updating dependencies..."
#     bundle install
#     log "Done."
#   fi
# fi

exec tini -- "$@"
