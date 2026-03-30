#!/bin/bash

echo "Running PHP lint..."
find . -name "*.php" -exec php -l {} \;

echo "Running PHPCS..."
if command -v phpcs &> /dev/null
then
  phpcs --standard=PSR12 .
else
  echo "PHPCS not installed locally, skipping..."
fi

echo "Resetting permissions..."
chmod -R 755 .

echo "Done!"
