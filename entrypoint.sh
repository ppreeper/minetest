#!/bin/sh

set -e

CFG="/config/.minetest/main-config/minetest.conf"
WORLD="/config/.minetest/worlds/world"

[ -z "${CLI_ARGS}" ] && export CLI_ARGS=""

echo ${CLI_ARGS}

case "$1" in
    -- | minetest)
        minetestserver --config ${CFG} --world ${WORLD} ${CLI_ARGS}
        ;;
    *) exec "$@" ;;
esac