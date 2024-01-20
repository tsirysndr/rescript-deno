![cover](https://cdn.jsdelivr.net/gh/tsirysndr/rescript-deno@main/.github/images/cover.png)

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

- [ ] Broadcast Channel
- [ ] Cache API
- [ ] Compression Streams API
- [ ] DOM APIs
- [ ] DOM Events
- [ ] Encoding API
- [ ] Errors
- [ ] ES Modules
- [ ] Fetch API
- [x] File System
- [ ] HTTP Server
- [ ] I/O
- [ ] Network
- [ ] Observability
- [ ] Performance
- [ ] Permissions
- [ ] Runtime Environment
  - [x] Deno.version
  - [x] Deno.pid
  - [x] Deno.ppid
  - [x] Deno.noColor
  - [x] Deno.args
  - [x] Deno.mainModule
  - [x] Deno.build
  - [x] Deno.env
  - [x] Deno.exit
- [ ] Scheduling
- [ ] Streams API
- [ ] Sub Process
- [ ] Testing
- [ ] Timers
- [ ] Typed Arrays
- [ ] Web APIs
- [ ] Web Crypto API
- [ ] Web File API
- [ ] Web Sockets
- [ ] Web Storage API
- [ ] Web Workers
- [ ] WebAssembly
- [ ] WebGPU


## 🤝 Contributing

Contributions, issues and feature requests are welcome!
See [CONTRIBUTING.md](CONTRIBUTING.md) for more info.