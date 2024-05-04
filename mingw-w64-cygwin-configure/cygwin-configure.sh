#!/bin/bash

. ${MINGW_PREFIX}/bin/cygwin-env @TRIPLE@

# check if last arg is a path to configure, else use parent
for last; do true; done
if test -x "${last}/configure"; then
  config_path="$last"
else
  config_path=".."
fi

${config_path}/configure \
  --host=@TRIPLE@ --target=@TRIPLE@ --build="$CHOST" \
  --prefix=${MINGW_PREFIX}/@TRIPLE@ --libdir=${MINGW_PREFIX}/@TRIPLE@/lib --includedir=${MINGW_PREFIX}/@TRIPLE@/include \
  --enable-shared --enable-static "$@"
