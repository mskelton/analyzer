---
sidebar_position: 1
---

# Contributing

:::tip

Analyzer is built using [Remix](https://remix.run), [MongoDB](mongodb.com),
[Tailwind CSS](https://tailwindcss.com). Before you start contributing, we
recommend familiarizing yourself with these tools to get a basic understanding
of how they work.

:::

## Setup the database

Analyzer uses MongoDB as the primary data source. This can be run locally using
Docker by executing the following command:

```bash
docker-compose up -d
```

## Run the app

The Remix app and Tailwind CSS watcher can be started with a single command
thanks to [concurrently](https://www.npmjs.com/package/concurrently).

```bash
yarn dev
```
