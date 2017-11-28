#!/bin/sh

if [[ x${SDKROOT} == "x" ]] ; then
    echo 'Not under Xcode environment.'
    echo 'Starting self under xcrun…'
    xcrun sh $0
    exit $?
fi

echo 'Patching modulemap…'
patch ${SDKROOT}/usr/include/module.modulemap $(dirname $0)/libxml2.diff

echo 'Symlinking libxml2…'
ln -s ${SDKROOT}/usr/include/libxml2/libxml ${SDKROOT}/usr/include/libxml

echo 'Done'
