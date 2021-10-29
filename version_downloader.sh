#!/bin/bash

VERSION_BASE_URL=https://storage.googleapis.com/flutter_infra_release/releases/
VERSION_JSON_URL="${VERSION_BASE_URL}releases_macos.json"

touch availableVersions
touch availableVersionLabels

curl $VERSION_JSON_URL | python json_parser.py $1
cat availableVersions

echo "Enter index of desired version: "
read inputVersion

selectedArchive=`cat availableVersionLabels | tail -n $inputVersion | head -n 1`
selectedVersion=`echo $selectedArchive | cut -d '_' -f3`
echo $selectedArchive


rm availableVersions
rm availableVersionLabels

curl "${VERSION_BASE_URL}${selectedArchive}" -o "$selectedVersion"

