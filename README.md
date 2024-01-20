# rescript-deno 🦕

Use [Deno](https://deno.com/) with [ReScript](https://rescript-lang.org/).

> Note: This is a work in progress. 🏗️🚧
>
> Project Status: 🐲 Unstable, alpha-ish quality.

## 🚚 Install

You need to be on at least a recent RC of ReScript v11.

```sh
npm i rescript-deno @rescript/core
```

Include them in your `rescript.json`:

```json
{
  "bs-dependencies": ["@rescript/core", "rescript-deno"]
}
```

`rescript-deno` is [namespaced](https://rescript-lang.org/docs/manual/latest/build-configuration#name-namespace), so you'll find all modules listed under the main module `RescriptDeno`.

**You're strongly encouraged to open `RescriptDeno` globally, to get the best possible developer experience.** You do that by adding this to your `rescript.json`:

```json
{
  "bsc-flags": [
    "-open RescriptCore",
    "-open RescriptDeno",
    "-open RescriptDeno.Globals"
  ]
}
```

This might be a matter of taste, but I recommend opening it to get the best experience.

This will make all of Deno available to you without needing to dip into the `RescriptDeno` module explicitly.

## 🧑‍🔬 Examples

See [playground](playground) directory in this repo.

## 📑 Current Coverage

There's still a good amount of bindings missing. Here's what's currently available:

### Broadcast Channel

TODO

### Cache API

TODO

### Compression Streams API

TODO

### DOM APIs

TODO

### DOM Events

TODO

### Encoding API

TODO

### Errors

TODO

### ES Modules

TODO

### Fetch API

TODO

### File System

- [x] Deno.chmod
- [x] Deno.chmodSync
- [x] Deno.chown
- [x] Deno.chownSync
- [x] Deno.copyFile
- [x] Deno.copyFileSync
- [x] Deno.create
- [x] Deno.createSync
- [x] Deno.fstat
- [x] Deno.fstatSync
- [x] Deno.ftruncate
- [x] Deno.ftruncateSync
- [x] Deno.futime
- [x] Deno.link
- [x] Deno.linkSync
- [x] Deno.lstat
- [x] Deno.lstatSync
- [x] Deno.makeTempDir
- [x] Deno.makeTempDirSync
- [x] Deno.makeTempFile
- [x] Deno.makeTempFileSync
- [x] Deno.mkdir
- [x] Deno.mkdirSync
- [x] Deno.open
- [x] Deno.openSync
- [x] Deno.readDir
- [x] Deno.readDirSync
- [x] Deno.readFile
- [x] Deno.readFileSync

### HTTP Server

TODO

### I/O

TODO

### Network

TODO

### Observability

TODO

### Performace

TODO

### Permissions

TODO

### Runtime Environment

- [x] Deno.version
- [x] Deno.pid
- [x] Deno.ppid
- [x] Deno.noColor
- [x] Deno.args
- [x] Deno.mainModule
- [x] Deno.build 
- [x] Deno.env
- [x] Deno.exit


### Scheduling

TODO

### Streams API

TODO

### Sub Process

TODO

### Testing

TODO

### Timers

TODO

### Typed Arrays

TODO

### Web APIs

TODO

### Web Crypto API

TODO

### Web File API

TODO

### Web Sockets

TODO

### Web Storage API

TODO

### Web Workers

TODO

### WebAssembly

TODO

### WebGPU

TODO


## 🤝 Contributing

Contributions, issues and feature requests are welcome!
See [CONTRIBUTING.md](CONTRIBUTING.md) for more info.