#!/usr/bin/env bash
export PATH=$PATH:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin
TZ='UTC'; export TZ

cd "$(dirname "$0")"
cd repos
rm -fr packages.tar.gz
sleep 1
cat packages.tar.gz.part* > packages.tar.gz
sha256sum -c packages.tar.gz.sha256

rc=$?
if [[ $rc != 0 ]]; then
    echo
    exit 1
fi
echo

tar -xf packages.tar.gz
sleep 2
rm -fr packages.tar.gz*
echo ' extract done'
exit 0

