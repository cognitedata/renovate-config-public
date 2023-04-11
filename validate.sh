#!/usr/bin/env bash
set -eu -o pipefail

echo "Fetching latest JSON Schema"
curl -s https://docs.renovatebot.com/renovate-schema.json >renovate-schema.json

# As of this writing, Renovate uses draft-04 which is
# too old for the validate command of ajv.
echo "Migrating schema to newer version"
npx ajv migrate -s renovate-schema.json

for file in *.json; do
  if [ "$file" = "package.json" ] || [ "$file" = "package-lock.json" ] || [ "$file" = "renovate-schema.json" ]; then
    continue
  fi

  echo
  echo "Validating $file"
  npx ajv -s renovate-schema.json -d "$file" -c ajv-formats
done
