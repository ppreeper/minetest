FROM docker.io/alpine:edge as builder

ENV MT_REPO="https://github.com/minetest/minetest_game"
ENV MT_VER=5.7.0

ENV MC_REPO="https://git.minetest.land/MineClone2/MineClone2"
ENV MC_VER=0.83.1

RUN apk add --no-cache minetest-server git

RUN mkdir -p /config/.minetest/main-config /config/.minetest/games /config/.minetest/mods /config/.minetest/worlds

RUN cp /etc/minetest/minetest.conf /config/.minetest/main-config/minetest.conf.orig
RUN echo "default_game = minetest" > /config/.minetest/main-config/minetest.conf

RUN git clone --depth 1 --branch $MT_VER $MT_REPO /config/.minetest/games/minetest
RUN git clone --depth 1 --branch $MC_VER $MC_REPO /config/.minetest/games/mineclone2

FROM docker.io/alpine:edge as production

RUN apk add --no-cache minetest-server && mkdir -p /config && ln -s /config/.minetest/games /usr/share/minetest/games

COPY --from=builder /config /config/.

COPY entrypoint.sh /usr/bin/entrypoint.sh
RUN chmod +x /usr/bin/entrypoint.sh

# ports and volumes
EXPOSE 30000/udp
ENTRYPOINT [ "/usr/bin/entrypoint.sh" ]
CMD ["minetest"]
