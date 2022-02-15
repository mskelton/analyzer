# Analyzer

[![Build](https://github.com/mskelton/analyzer/actions/workflows/build.yml/badge.svg)](https://github.com/mskelton/analyzer/actions/workflows/build.yml)

Forex trading analysis and sharing tool.

## Development

The service and frontend can be started with a single command thanks to
[concurrently](https://www.npmjs.com/package/concurrently).

```sh
yarn dev
```

### Database instrumentation

The service uses MongoDB as the primary data source. This can be run locally
using Docker by executing the following command:

```sh
docker-compose up -d
```

### EA

To install the EA, run the following command to symlink it to the MT5 `Experts`
folder:

```sh
ln -s ~/dev/analyzer/ea/Analyzer.mq5 ~/Library/Application\ Support/MetaTrader\ 5/Bottles/metatrader5/drive_c/Program\ Files/MetaTrader\ 5/MQL5/Experts/Analyzer.mq5
```

_Unfortunately, we do not currently support compiling the EA without using the
MetaEditor GUI._

### Testing

Service integration tests and frontend end-to-end tests are run with
[Playwright](https://playwright.dev).

```sh
yarn test:integ
yarn test:e2e
```
