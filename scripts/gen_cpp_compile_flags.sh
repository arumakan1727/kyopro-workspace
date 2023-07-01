#!/usr/bin/env bash
set -euo pipefail

scriptDir=$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)
repoRoot=$(dirname "$scriptDir")

cat << EOT
-std=c++17
-I${repoRoot}/include
-Wall
-Wextra

-Wfloat-equal
-Winit-self
-Winvalid-pch
-Wmissing-include-dirs
-Wshadow
-Wsign-conversion
-Wswitch-enum
EOT
