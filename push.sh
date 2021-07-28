#!/bin/bash
VERSION="v10"

git add . & 
git commit -m "release ${VERSION}" & 
git tag -a -m "My action release ${VERSION}" ${VERSION} & 
git push origin main --follow-tags