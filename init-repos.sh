#!/bin/bash
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

set -e

if [[ -e /repos/test-repo ]] && [[ -e /repos/land-repo ]] && [[ -e /repos/try ]]; then
    exit
fi

echo 'initialising repos'
rm -rf /repos/test-repo /repos/land-repo /repos/try
hg init /repos/test-repo
cd /repos/test-repo
echo test-repo > readme
hg commit -Am 'initial commit'
hg phase --public -r .
cp -a /repos/test-repo /repos/land-repo
cp -a /repos/test-repo /repos/try
echo -e '[phases]\npublish = false' > /repos/test-repo/.hg/hgrc
chown -R apache:apache /repos
