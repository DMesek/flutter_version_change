#!/bin/bash

versionLabel="flutterVersionFolder"
pathLabel="pathFolder"
source fvc.config
if [[ "$1" == "config" ]] && [[ "$2" == "--version-folder" ]]; then
    touch fvc.tmp.config && echo "${pathLabel}=${pathFolder}" >> fvc.tmp.config
    echo "${versionLabel}=$3" >> fvc.tmp.config
    rm fvc.config && mv fvc.tmp.config fvc.config
fi

if [[ "$1" == "config" ]] && [[ "$2" == "--path-folder" ]]; then
    touch fvc.tmp.config && echo "${versionLabel}=${flutterVersionFolder}" >> fvc.tmp.config
    echo "${pathLabel}=$3" >> fvc.tmp.config
    rm fvc.config && mv fvc.tmp.config fvc.config
fi

if [[ "$1" == "config" ]] && [[ "$2" == "--default" ]]; then
    rm fvc.config && touch fvc.config
    echo "${versionLabel}=$HOME/flutter/versions" >> fvc.config
    echo "${pathLabel}=/usr/local/bin" >> fvc.config
fi

if [[ "$1" == "download" ]] && [[ "$2" == "--channel" ]]; then
    if [[ "$3" != "beta" ]] && [[ "$3" != "stable" ]] && [[ "$3" != "dev" ]]; then
        echo "Supported channels are: beta, dev and stable"
        exit 1
    fi
    bash version_downloader.sh "$3"
fi

if [ -z "$1" ]; then
    ./fvc_change_version
fi

