# Analyzer

[![Build](https://github.com/mskelton/analyzer/actions/workflows/build.yml/badge.svg)](https://github.com/mskelton/analyzer/actions/workflows/build.yml)

Forex trading analysis and sharing tool.

## Development

The service and app can be started with a single command thanks to
[concurrently](https://www.npmjs.com/package/concurrently).

```sh
yarn dev
```

### EA

To install the EA, run the following command to symlink it to the MT5 Experts
folder:

```sh
ln -s ~/dev/analyzer/ea/Analyzer.mq5 \
   ~/Library/Application\ Support/MetaTrader\ 5/Bottles/metatrader5/drive_c/Program\ Files/MetaTrader\ 5/MQL5/Experts/Analyzer.mq5
```

Unfortunately, we do not currently support compiling the EA without using the
MetaEditor GUI.

### Testing

Service integration tests and app end-to-end tests are run with
[Playwright](https://playwright.dev).

```sh
yarn test:integ
yarn test:e2e
```
