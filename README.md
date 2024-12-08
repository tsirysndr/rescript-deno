<div>
  <img src="https://rescript-lang.org/static/brand/rescript-logo.svg" width="400"  />
  <img src="https://github.com/denoland/docs/raw/fc4f4c790d9b76fa03fd3b61f6ee086431de3a10/static/img/logo.svg" height="100" /> 
</div>

# rescript-deno 🦕

Use [Deno](https://deno.com/) with [ReScript](https://rescript-lang.org/).

> Note: This is a work in progress. 🏗️🚧
>
> Project Status: 🐲 Unstable, alpha-ish quality.

## 🚚 Install

You need to be on at least a recent RC of ReScript v11.

```sh
npm i @tsirysndr/rescript-deno @rescript/core
```

Include them in your `rescript.json`:

```json
{
  "bs-dependencies": ["@rescript/core", "@tsirysndr/rescript-deno"]
}
```

`rescript-deno` is [namespaced](https://rescript-lang.org/docs/manual/latest/build-configuration#name-namespace), so you'll find all modules listed under the main module `TsirysndrRescriptDeno`.

**You're strongly encouraged to open `TsirysndrRescriptDeno` globally, to get the best possible developer experience.** You do that by adding this to your `rescript.json`:

```json
{
  "bsc-flags": [
    "-open TsirysndrRescriptDeno",
    "-open TsirysndrRescriptDeno.Globals",
    "-open RescriptCore"
  ]
}
```

This might be a matter of taste, but I recommend opening it to get the best experience.

This will make all of Deno available to you without needing to dip into the `TsirysndrRescriptDeno` module explicitly.

## 🧑‍🔬 Examples

A Simple HTTP Server:

```rescript
Deno.serveWithOptions({port: 8007}, ~handler=req => {
  Response.new(String("Hello, world!"))
})->ignore
```

Make a request to a server:

```rescript
let result = await fetch(String("https://rickandmortyapi.com/api/character"))
Console.log(await result->Response.json)
```

See [playground](playground) directory in this repo for more examples.

## 📑 Current Coverage

There's still a good amount of bindings missing. Here's what's currently available:

- [ ] Broadcast Channel
  - [ ] BroadcastChannel
- [x] Cloud
  - [x] Deno KV
  - [x] Deno Cron
  - [x] Deno Queue
- [ ] Cache API
  - [ ] Cache
  - [ ] CacheStorage
  - [ ] caches
- [ ] Compression Streams API
  - [ ] CompressionStream
  - [ ] DecompressionStream
- [ ] DOM APIs
- [ ] DOM Events
- [x] Encoding API
  - [x] TextDecoder
  - [x] TextEncoder
  - [x] atob
  - [x] btoa
- [ ] Errors
- [ ] ES Modules
- [ ] Fetch API
  - [x] Body
  - [ ] EventSource
  - [x] FormData
  - [x] Headers
  - [x] Request
  - [x] Response
  - [x] ResponseInit
  - [x] BodyInit
  - [x] fetch
- [x] File System
- [ ] HTTP Server
  - [x] Deno.serve
  - [ ] Deno.serveHttp
- [x] I/O
- [x] Network
  - [x] Deno.connect
  - [x] Deno.connectTls
  - [x] Deno.listen
  - [x] Deno.listenTls
  - [x] Deno.networkInterfaces
  - [x] Deno.resolveDns
  - [x] Deno.shutdown
  - [x] Deno.startTls
- [ ] Observability
- [ ] Performance
- [x] Permissions
- [x] Runtime Environment
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
- [x] Sub Process
  - [x] Deno.ChildProcess
  - [x] Deno.Command
  - [x] Deno.kill
- [ ] Testing
  - [ ] Deno.test
  - [ ] Deno.bench
- [ ] Timers
- [ ] Typed Arrays
- [ ] Web APIs
- [ ] Web Crypto API
- [ ] Web File API
  - [x] Blob
  - [x] File
  - [ ] FileReader
- [x] Web Sockets
  - [x] CloseEvent
  - [x] WebSocket
- [ ] Web Storage API
  - [ ] Storage
  - [ ] localStorage
  - [ ] sessionStorage
- [ ] Web Workers
  - [ ] Worker
- [ ] WebAssembly
- [ ] WebGPU

## 🤝 Contributing

Contributions, issues and feature requests are welcome!
See [CONTRIBUTING.md](CONTRIBUTING.md) for more info.
