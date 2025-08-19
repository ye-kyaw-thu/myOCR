#!/bin/bash

mkdir -p random_samples

find . -maxdepth 1 -name "*.png" -type f | sed 's|^\./||' | cut -d'_' -f1 | sort -u | while read font; do
    echo "=== $font ==="
    find . -maxdepth 1 -name "${font}_*.png" -type f | sed 's|^\./||' | shuf | head -n 2 | while read file; do
        cp "$file" "random_samples/"
        echo "Copied: $file"
    done
    echo
done

echo "Done! Random samples are in random_samples/ folder"
