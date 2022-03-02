# Analyzer

[![Build](https://github.com/mskelton/analyzer/actions/workflows/build.yml/badge.svg)](https://github.com/mskelton/analyzer/actions/workflows/build.yml)

Forex trading analysis and sharing tool.

## Development

The Remix app and CSS watcher can be started with a single command thanks to
[concurrently](https://www.npmjs.com/package/concurrently).

```sh
yarn dev
```

### Database instrumentation

The app uses MongoDB as the primary data source. This can be run locally using
Docker by executing the following command:

```sh
docker-compose up -d
```

### EA

To install the EA, run the following command to symlink it to the MT5 `Experts`
folder:

```sh
ln -s ~/dev/analyzer/ea/src/* ~/Library/Application\ Support/MetaTrader\ 5/Bottles/metatrader5/drive_c/Program\ Files/MetaTrader\ 5/MQL5/Experts
```

_Unfortunately, we do not currently support compiling the EA without using the
MetaEditor GUI._

After compiling the EA in MetaEditor, you can copy the compiled expert into the
repo for distribution with the following command.

```sh
cp ~/Library/Application\ Support/MetaTrader\ 5/Bottles/metatrader5/drive_c/Program\ Files/MetaTrader\ 5/MQL5/Experts/Analyzer.ex5 ~/dev/analyzer/ea
```

### Testing

End-to-end tests are run with [Playwright](https://playwright.dev).

```sh
yarn test
```
