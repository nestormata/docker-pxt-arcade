FROM node:alpine


WORKDIR /usr/src/app

RUN npm i npm@latest -g \
    && npm install -g pxt \
    && npm install -g gulp

RUN apk update && apk add git

ADD pxt pxt
ADD pxt-common-packages pxt-common-packages
ADD pxt-arcade pxt-arcade
# RUN git clone https://github.com/microsoft/pxt.git --branch master --single-branch \
#     && cd pxt \
#     && npm install \
#     && npm run build \
#     && cd ..

# RUN git clone https://github.com/microsoft/pxt-common-packages.git --branch master --single-branch \
#     && cd pxt-common-packages \
#     && npm install \
#     && npm link ../pxt \
#     && cd ..

# RUN git clone https://github.com/nestormata/pxt-arcade.git --branch master --single-branch \
#     && cd pxt-arcade \
#     && npm install \
#     && npm link ../pxt \
#     && npm link ../pxt-common-packages \
#     && cd ..

# Install Docker CLI (not Docker daemon)
# RUN apk update && apk add docker-cli

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 3232

ENTRYPOINT ["/entrypoint.sh"]
