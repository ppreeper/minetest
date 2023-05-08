# minetest

[Minetest](http://www.minetest.net/) (server) is a near-infinite-world block sandbox game and a game engine, inspired by InfiniMiner, Minecraft, and the like.

[![minetest](https://raw.githubusercontent.com/minetest/minetest/master/textures/base/pack/logo.png)](http://www.minetest.net/)

## Application Setup

You can find the world maps, mods folder and config files in /config/.minetest.

If you want to override the advertised port, ensure you add --port in your CLI_ARGS AND ensure the internal port reflects the change, ie;
if you set your advertised port to 40000 with --port 40000 then your ports declaration should be 40000:40000/udp
