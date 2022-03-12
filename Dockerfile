###############################################################################
### BASE IMAGE ################################################################
###############################################################################
FROM node:16-bullseye-slim as base

# Set the NODE_ENV for all images
ENV NODE_ENV production

# Install openssl for Prisma
RUN apt-get update && apt-get install -y openssl

###############################################################################
### INSTALL ALL DEPS ##########################################################
###############################################################################
FROM base as deps

WORKDIR /app

COPY . .

RUN yarn install --immutable

###############################################################################
### INSTALL PRODUCTION DEPS ###################################################
###############################################################################
FROM deps as production-deps

WORKDIR /app

COPY --from=deps /app/node_modules /app/node_modules
COPY . .

RUN yarn workspaces focus --all --production

###############################################################################
### BUILD THE APP #############################################################
###############################################################################
FROM deps as build

WORKDIR /app

COPY --from=deps /app/node_modules /app/node_modules
COPY . .

RUN yarn setup
RUN yarn build

###############################################################################
### FINAL IMAGE ##############################################################
###############################################################################
FROM base

WORKDIR /app

COPY --from=production-deps /app/node_modules /app/node_modules
COPY --from=build /app/node_modules/.prisma /app/node_modules/.prisma

COPY --from=build /app/build /app/build
COPY --from=build /app/public /app/public
COPY . .

CMD ["yarn", "start"]
