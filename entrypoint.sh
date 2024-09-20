#!/bin/sh

# if [ ! -d "pxt/node_modules" ]; then
#     cd pxt \
#     && npm install \
#     && npm run build \
#     && cd ..
# fi
# if [ ! -d "pxt-common-packages/node_modules" ]; then
#     cd pxt-common-packages \
#     && npm install \
#     && link ../pxt \
#     && cd ..
# fi
# if [ ! -d "pxt-arcade/node_modules" ]; then
#     cd pxt-arcade \
#     && npm install \
#     && link ../pxt \
#     && link ../pxt-common-packages \
#     && cd ..
# fi

cd pxt-arcade
if [ ! -z "$*" ]; then
    pxt $*
else
    pxt serve -h 0.0.0.0 -p 3232 --noBrowser --local
fi
