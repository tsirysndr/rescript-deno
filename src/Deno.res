open Globals

type build = {
  target: string,
  arch: string,
  os: string,
  vendor: string,
  env: string,
}
@scope("Deno") @val external version: string = "version"
@scope("Deno") @val external pid: int = "pid"
@scope("Deno") @val external ppid: int = "ppid"
@scope("Deno") @val external noColor: bool = "noColor"
@scope("Deno") @val external args: array<string> = "args"
@scope("Deno") @val external mainModule: string = "mainModule"
@scope("Deno") @val external build: build = "build"
@scope("Deno") @val external env: Env.t = "env"
@scope("Deno") @val external exit: int => unit = "exit"

module ConsoleSize = {
  type t = {
    columns: int,
    rows: int,
  }
}

module InspectOptions = {
  type t = {
    colors?: bool,
    compact?: bool,
    depth?: int,
    breakLength?: int,
    escapeSequences?: bool,
    iterableLimit?: int,
    showProxy?: bool,
    sorted?: bool,
    trailingComma?: bool,
    getters?: bool,
    showHidden?: bool,
    strAbbreviateSize?: int,
  }
}
@scope("Deno") @val external consoleSize: unit => ConsoleSize.t = "consoleSize"
@scope("Deno") @val external inspect: ('a, ~options: InspectOptions.t=?) => string = "inspect"

module SetRawOptions = {
  type t = {cbreak: bool}
}

module SeekMode = {
  type t = | @int(0) Start | @int(1) Current | @int(2) End
}

module FileInfo = {
  type t

  @get external isFile: t => bool = "isFile"

  @get external isDirectory: t => bool = "isDirectory"

  @get external isSymlink: t => bool = "isSymlink"

  @get external size: t => int = "size"

  @get external mtime: t => option<Date.t> = "mtime"

  @get external atime: t => option<Date.t> = "atime"

  @get external birthtime: t => option<Date.t> = "birthtime"

  @get external dev: t => int = "dev"

  @get external ino: t => option<int> = "ino"

  @get external mode: t => option<int> = "mode"

  @get external nlink: t => option<int> = "nlink"

  @get external uid: t => option<int> = "uid"

  @get external gid: t => option<int> = "gid"

  @get external rdev: t => option<int> = "rdev"

  @get external blksize: t => option<int> = "blksize"

  @get external blocks: t => option<int> = "blocks"

  @get external isBlockDevice: t => option<bool> = "isBlockDevice"

  @get external isCharDevice: t => option<bool> = "isCharDevice"

  @get external isFifo: t => option<bool> = "isFifo"

  @get external isSocket: t => option<bool> = "isSocket"
}

module FsFile = {
  type t

  @new external new: int => t = "FsFile"

  @get external readable: t => ReadableStream.t<Uint8Array.t> = "readable"

  @get external rid: t => int = "rid"

  @get external writable: t => WritableStream.t<Uint8Array.t> = "writable"

  @send external close: t => Promise.t<unit> = "close"

  @send external read: (t, Uint8Array.t) => Promise.t<int> = "read"

  @send external readSync: (t, Uint8Array.t) => int = "readSync"

  @send external _seek: (t, int, int) => Promise.t<int> = "seek"

  @send
  let seek = (fs, offset, whence) => {
    let whence = switch whence {
    | SeekMode.Start => 0
    | SeekMode.Current => 1
    | SeekMode.End => 2
    }
    fs->_seek(offset, whence)
  }

  @send external _seekSync: (t, int, int) => int = "seekSync"

  @send
  let seekSync = (fs, offset, whence) => {
    let whence = switch whence {
    | SeekMode.Start => 0
    | SeekMode.Current => 1
    | SeekMode.End => 2
    }
    fs->_seekSync(offset, whence)
  }

  @send external stat: t => Promise.t<FileInfo.t> = "stat"

  @send external statSync: t => FileInfo.t = "statSync"

  @send external truncate: (t, ~len: int=?) => Promise.t<unit> = "truncate"

  @send external truncateSync: (t, ~len: int=?) => unit = "truncateSync"

  @send external write: (t, Uint8Array.t) => Promise.t<int> = "write"

  @send external writeSync: (t, Uint8Array.t) => int = "writeSync"
}

module MakeTempOptions = {
  type t = {
    dir?: string,
    prefix?: string,
    suffix?: string,
  }
}

module MkdirOptions = {
  type t = {
    recursive?: bool,
    mode?: int,
  }
}

module OpenOptions = {
  type t = {
    read?: bool,
    write?: bool,
    append?: bool,
    truncate?: bool,
    create?: bool,
    createNew?: bool,
    mode?: int,
  }
}

module DirEntry = {
  type t

  @get external name: t => string = "name"

  @get external isFile: t => bool = "isFile"

  @get external isDirectory: t => bool = "isDirectory"

  @get external isSymlink: t => bool = "isSymlink"
}

module ReadFileOptions = {
  type t = {signal?: AbortSignal.t}
}

module RemoveOptions = {
  type t = {recursive?: bool}
}

module SymlinkOptions = {
  type t = {\"type"?: string}
}

module WatchFsOptions = {
  type t = {recursive?: bool}
}

module FsWatcher = {
  type t

  @get external rid: t => int = "rid"

  @send external close: t => unit = "close"
}

module WriteFileOptions = {
  type t = {
    append?: bool,
    create?: bool,
    createNew?: bool,
    mode?: int,
    signal?: AbortSignal.t,
  }

  @get external append: t => bool = "append"
  @get external create: t => bool = "create"
  @get external createNew: t => bool = "createNew"
  @get external mode: t => int = "mode"
  @get external signal: t => AbortSignal.t = "signal"
}

module HttpServer = {
  type t

  @get external finished: t => Promise.t<unit> = "finished"

  @send external ref: t => unit = "ref"

  @send external unref: t => unit = "unref"

  @send external shutdown: t => Promise.t<unit> = "shutdown"
}

module NetAddr = {
  type t = {
    hostname: string,
    port: int,
    transport: string,
  }
}

module ServeHandlerInfo = {
  type t
  @get external remoteAddr: t => NetAddr.t = "remoteAddr"
}

module ServeHandler = {
  type t = Request.t => Response.t
}

module ServeHandlerAsync = {
  type t = Request.t => Promise.t<Response.t>
}

module ServeUnixOptions = {
  type callback<'a> =
    | Fn('a => Response.t)
    | AsyncFn('a => Promise.t<Response.t>)

  type t<'a, 'b> = {
    path: string,
    signal?: AbortSignal.t,
    onError?: callback<'a>,
    onListen?: 'b => unit,
  }
}

module ServeOptions = {
  type t<'a, 'b> = {
    port?: int,
    hostname?: string,
    signal?: AbortSignal.t,
    reusePort?: bool,
    onError?: 'a => unit,
    onListen?: 'b => unit,
  }
}

module ServeTlsOptions = {
  type t<'a, 'b> = {
    cert: string,
    key: string,
    port?: int,
    hostname?: string,
    signal?: AbortSignal.t,
    reusePort?: bool,
    onError?: 'a => unit,
    onListen?: 'b => unit,
  }
}

module ListenOptions = {
  type t = {
    hostname?: string,
    port?: int,
  }
}

module TcpListenOptions = {
  type t = {...ListenOptions.t, reusePort?: bool, transport?: string}
}

module ListenTlsOptions = {
  type t = {
    ...TcpListenOptions.t,
    key?: string,
    cert?: string,
    certFile?: string,
    keyFile?: string,
    alpnProtocols?: Belt.Array.t<string>,
  }
}

module Listener = {
  type t<'a>

  @get external addr: t<'a> => NetAddr.t = "addr"

  @get external rid: t<'a> => int = "rid"

  @send external accept: t<'a> => Promise.t<'a> = "accept"

  @send external close: t<'a> => Promise.t<unit> = "close"

  @send external ref: t<'a> => unit = "ref"

  @send external unref: t<'a> => unit = "unref"
}

module ConnectOptions = {
  type t = {
    port: int,
    hostname?: string,
    transport?: string,
  }
}

module TcpConn = {
  type t

  @get external localAddr: t => NetAddr.t = "localAddr"

  @get external remoteAddr: t => NetAddr.t = "remoteAddr"

  @get external rid: t => int = "rid"

  @get external readable: t => ReadableStream.t<Uint8Array.t> = "readable"

  @get external writable: t => WritableStream.t<Uint8Array.t> = "writable"

  @send external closeWrite: t => Promise.t<unit> = "close"
  @send external ref: t => unit = "ref"
  @send external unref: t => unit = "unerf"
  @send external setNoDelay: (t, bool) => unit = "setNoDelay"
  @send external setKeepAlive: (t, bool) => unit = "setKeepAlive"
}

module Conn = {
  type t

  @get external localAddr: t => NetAddr.t = "localAddr"
  @get external remoteAddr: t => NetAddr.t = "remoteAddr"
  @get external rid: t => int = "rid"
  @get external readable: t => ReadableStream.t<Uint8Array.t> = "readable"
  @get external writable: t => WritableStream.t<Uint8Array.t> = "writable"
  @send external closeWrite: t => Promise.t<unit> = "close"
  @send external ref: t => unit = "ref"
  @send external unref: t => unit = "unref"
}

module ConnectTlsOptions = {
  type t = {
    port: int,
    hostname?: string,
    certFile?: string,
    caCerts?: Belt.Array.t<string>,
    alpnProtocols?: Belt.Array.t<string>,
    certChain?: string,
    privateKey?: string,
  }
}

module TlsHandshakeInfo = {
  type t

  @get external alpnProtocol: t => Nullable.t<string> = "alpnProtocol"
}

module TlsConn = {
  type t
  @get external localAddr: t => NetAddr.t = "localAddr"
  @get external remoteAddr: t => NetAddr.t = "remoteAddr"
  @get external rid: t => int = "rid"
  @get external readable: t => ReadableStream.t<Uint8Array.t> = "readable"
  @get external writable: t => WritableStream.t<Uint8Array.t> = "writable"
  @send external handshake: t => Promise.t<TlsHandshakeInfo.t> = "handshake"
  @send external closeWrite: t => Promise.t<unit> = "close"
  @send external ref: t => unit = "ref"
  @send external unref: t => unit = "unref"
}

module NetworkInterfaceInfo = {
  type t

  @get external name: t => string = "name"

  @get external family: t => string = "familly"

  @get external address: t => string = "address"

  @get external netmask: t => string = "netmask"

  @get external scopeId: t => Nullable.t<string> = "scopeid"

  @get external cidr: t => string = "cidr"

  @get external mac: t => string = "mac"
}

module ResolveDnsOptions = {
  type nameServer = {ipAddr: string, port?: int}

  type t = {
    nameServer?: nameServer,
    signal?: AbortSignal.t,
  }
}

module StartTlsOptions = {
  type t = {
    hostname?: string,
    caCerts?: Belt.Array.t<string>,
    alpnProtocols?: Belt.Array.t<string>,
  }
}

module CommandOptions = {
  type t<'a> = {
    args?: Belt.Array.t<string>,
    cwd?: string,
    clearEnv?: bool,
    env?: 'a,
    uid?: int,
    gid?: int,
    signal?: AbortSignal.t,
    stdin?: string,
    stdout?: string,
    stderr?: string,
    windowsRawArguments?: bool,
  }
}

module CommandOutput = {
  type t

  @get external success: t => bool = "success"
  @get external code: t => int = "code"
  @get external signal: t => Nullable.t<string> = "signal"
  @get external stdout: t => Uint8Array.t = "stdout"
  @get external stderr: t => Uint8Array.t = "stderr"
}

module CommandStatus = {
  type t

  @get external success: t => bool = "success"
  @get external code: t => int = "code"
  @get external signal: t => Nullable.t<string> = "signal"
}

module ChildProcess = {
  type t

  @get external pid: t => int = "pid"
  @get external status: t => Promise.t<CommandStatus.t> = "status"
  @get external stderr: t => ReadableStream.t<Uint8Array.t> = "stderr"
  @get external stdin: t => ReadableStream.t<Uint8Array.t> = "stdin"
  @get external stdout: t => ReadableStream.t<Uint8Array.t> = "stdout"

  @send external kill: (t, string) => Promise.t<unit> = "kill"
  @send external output: t => Promise.t<CommandOutput.t> = "output"
  @send external ref: t => unit = "ref"
  @send external unref: t => unit = "unref"
}

module Command = {
  type t

  @scope("Deno") @new external new: (string, ~options: CommandOptions.t<'a>=?) => t = "Command"

  @send external output: t => Promise.t<CommandOutput.t> = "output"

  @send external outputSync: t => CommandOutput.t = "outputSync"

  @send external spawn: t => ChildProcess.t = "spawn"
}

@scope("Deno") external chmod: (string, int) => Promise.t<unit> = "chmod"

@scope("Deno") external chmodSync: (string, int) => unit = "chmodSync"

@scope("Deno") external chown: (string, ~uid: int=?, ~gid: int=?) => Promise.t<unit> = "chown"

@scope("Deno") external chownSync: (string, ~uid: int=?, ~gid: int=?) => unit = "chownSync"

@scope("Deno") external copyFile: (string, string) => Promise.t<unit> = "copyFile"

@scope("Deno") external copyFileSync: (string, string) => unit = "copyFileSync"

@scope("Deno") external create: string => Promise.t<FsFile.t> = "create"

@scope("Deno") external createSync: string => FsFile.t = "createSync"

@scope("Deno") external fstat: int => Promise.t<FileInfo.t> = "fstat"

@scope("Deno") external fstatSync: int => FileInfo.t = "fstatSync"

@scope("Deno") external ftruncate: (int, ~len: int=?) => Promise.t<unit> = "ftruncate"

@scope("Deno") external ftruncateSync: (int, ~len: int=?) => unit = "ftruncateSync"

@scope("Deno") external futime: (int, int, int) => Promise.t<unit> = "futime"

@scope("Deno") external futimeDate: (int, Date.t, Date.t) => Promise.t<unit> = "futime"

@scope("Deno") external futimeSync: (int, int, int) => unit = "futimeSync"

@scope("Deno") external futimeDateSync: (int, Date.t, Date.t) => unit = "futimeSync"

@scope("Deno") external link: (string, string) => Promise.t<unit> = "link"

@scope("Deno") external linkSync: (string, string) => unit = "linkSync"

@scope("Deno") external lstat: string => Promise.t<FileInfo.t> = "lstat"

@scope("Deno") external lstatSync: string => FileInfo.t = "lstatSync"

@scope("Deno")
external makeTempDir: (~options: MakeTempOptions.t=?) => Promise.t<string> = "makeTempDir"

@scope("Deno")
external makeTempDirSync: (~options: MakeTempOptions.t=?) => string = "makeTempDirSync"

@scope("Deno")
external makeTempFile: (~options: MakeTempOptions.t=?) => Promise.t<string> = "makeTempFile"

@scope("Deno")
external makeTempFileSync: (~options: MakeTempOptions.t=?) => string = "makeTempFileSync"

@scope("Deno") external mkdir: (string, ~options: MkdirOptions.t=?) => Promise.t<unit> = "mkdir"

@scope("Deno") external mkdirSync: (string, ~options: MkdirOptions.t=?) => unit = "mkdirSync"

@scope("Deno") external \"open": (string, ~options: OpenOptions.t=?) => Promise.t<FsFile.t> = "open"

@scope("Deno") external openSync: (string, ~options: OpenOptions.t=?) => FsFile.t = "openSync"

@scope("Deno") external readDir: string => AsyncIterator.t<DirEntry.t> = "readDir"

@scope("Deno") external readDirSync: string => Iterator.t<DirEntry.t> = "readDirSync"

@scope("Deno")
external readFile: (string, ~options: ReadFileOptions.t=?) => Promise.t<Uint8Array.t> = "readFile"

@scope("Deno")
external readFileSync: (string, ~options: ReadFileOptions.t=?) => Uint8Array.t = "readFileSync"

@scope("Deno") external readLink: string => Promise.t<string> = "readLink"

@scope("Deno") external readLinkSync: string => string = "readLinkSync"

@scope("Deno")
external readTextFile: (string, ~options: ReadFileOptions.t=?) => Promise.t<string> = "readTextFile"

@scope("Deno")
external readTextFileSync: (string, ~options: ReadFileOptions.t=?) => string = "readTextFileSync"

@scope("Deno") external realPath: string => Promise.t<string> = "realPath"

@scope("Deno") external realPathSync: string => string = "realPathSync"

@scope("Deno") external remove: (string, ~options: RemoveOptions.t=?) => Promise.t<unit> = "remove"

@scope("Deno") external removeSync: (string, ~options: RemoveOptions.t=?) => unit = "removeSync"

@scope("Deno") external rename: (string, string) => Promise.t<unit> = "rename"

@scope("Deno") external renameSync: (string, string) => unit = "renameSync"

@scope("Deno") external stat: string => Promise.t<FileInfo.t> = "stat"

@scope("Deno") external statSync: string => FileInfo.t = "statSync"

@scope("Deno")
external symlink: (string, string, ~options: SymlinkOptions.t=?) => Promise.t<unit> = "symlink"

@scope("Deno")
external symlinkSync: (string, string, ~options: SymlinkOptions.t=?) => unit = "symlinkSync"

@scope("Deno") external truncate: (string, ~len: int=?) => Promise.t<unit> = "truncate"

@scope("Deno") external truncateSync: (string, ~len: int=?) => unit = "truncateSync"

@scope("Deno") external utime: (string, int, int) => Promise.t<unit> = "utime"

@scope("Deno") external utimeDate: (string, Date.t, Date.t) => Promise.t<unit> = "utime"

@scope("Deno") external utimeSync: (string, int, int) => unit = "utimeSync"

@scope("Deno") external utimeDateSync: (string, Date.t, Date.t) => unit = "utimeSync"

@scope("Deno") external watchFs: (string, ~options: WatchFsOptions.t=?) => FsWatcher.t = "watchFs"

@scope("Deno")
external writeFile: (string, Uint8Array.t, ~options: WriteFileOptions.t=?) => Promise.t<unit> =
  "writeFile"

@scope("Deno")
external writeFileSync: (string, Uint8Array.t, ~options: WriteFileOptions.t=?) => unit =
  "writeFileSync"

module Data = {
  type t =
    | String(string)
    | ReadableStream(ReadableStream.t<string>)
}

@scope("Deno")
external _writeTextFile: (string, 'a, ~options: option<WriteFileOptions.t>=?) => Promise.t<unit> =
  "writeTextFile"

@scope("Deno")
external _writeTextFileSync: (string, 'a, ~options: option<WriteFileOptions.t>=?) => unit =
  "writeTextFileSync"

@scope("Deno")
let writeTextFile = (path, data, ~options: option<WriteFileOptions.t>=?) => {
  switch data {
  | Data.String(data) => _writeTextFile(path, data, ~options)
  | Data.ReadableStream(data) => _writeTextFile(path, data, ~options)
  }
}

@scope("Deno")
external _serve: (~handler: 'a) => HttpServer.t = "serve"

@scope("Deno")
external _serveWithOptions: (~options: 'a, ~handler: 'b=?) => HttpServer.t = "serve"

@scope("Deno")
let serve = (~handler: option<ServeHandler.t>=?, ~asyncHandler: option<ServeHandlerAsync.t>=?) => {
  switch (handler, asyncHandler) {
  | (Some(handler), None) => _serve(~handler)
  | (None, Some(handler)) => _serve(~handler)
  | _ => failwith("serve: invalid arguments")
  }
}

@scope("Deno")
let serveWithOptions = (
  options: ServeOptions.t<'a, 'b>,
  ~handler: option<ServeHandler.t>=?,
  ~asyncHandler: option<ServeHandlerAsync.t>=?,
) => {
  switch (handler, asyncHandler) {
  | (None, None) => _serveWithOptions(~options)
  | (Some(handler), None) => _serveWithOptions(~options, ~handler)
  | (None, Some(handler)) => _serveWithOptions(~options, ~handler)
  | _ => failwith("serve: invalid arguments")
  }
}

@scope("Deno")
let serveWithUnixOptions = (
  options: ServeUnixOptions.t<'a, 'b>,
  ~handler: option<ServeHandler.t>=?,
  ~asyncHandler: option<ServeHandlerAsync.t>=?,
) => {
  switch (handler, asyncHandler) {
  | (None, None) => _serveWithOptions(~options)
  | (Some(handler), None) => _serveWithOptions(~options, ~handler)
  | (None, Some(handler)) => _serve(~handler)
  | _ => failwith("serve: invalid arguments")
  }
}

@scope("Deno")
let serveWithTlsOptions = (
  options: ServeTlsOptions.t<'a, 'b>,
  ~handler: option<ServeHandler.t>=?,
  ~asyncHandler: option<ServeHandlerAsync.t>=?,
) => {
  switch (handler, asyncHandler) {
  | (None, None) => _serveWithOptions(~options)
  | (Some(handler), None) => _serveWithOptions(~options, ~handler)
  | (None, Some(handler)) => _serve(~handler)
  | _ => failwith("serve: invalid arguments")
  }
}

@scope("Deno") external listen: TcpListenOptions.t => Listener.t<'a> = "listen"

@scope("Deno") external listenTls: ListenTlsOptions.t => Listener.t<TlsConn.t> = "listenTls"

@scope("Deno") external connect: ConnectOptions.t => Promise.t<TcpConn.t> = "connect"

@scope("Deno") external connectTls: ConnectTlsOptions.t => Promise.t<TlsConn.t> = "connectTls"

@scope("Deno")
external networkInterfaces: unit => array<NetworkInterfaceInfo.t> = "networkInterfaces"

@scope("Deno")
external resolveDns: (string, string, ~options: ResolveDnsOptions.t=?) => Promise.t<string> =
  "resolveDns"

@scope("Deno")
external shutdown: int => Promise.t<unit> = "shutdown"

@scope("Deno")
external startTls: (TcpConn.t, ~options: StartTlsOptions.t=?) => Promise.t<TlsConn.t> = "startTls"

@scope("Deno")
external kill: (int, ~signo: string=?) => Promise.t<unit> = "kill"

module Telemetry = {
  module Context = {
    type t

    @send external deleteValue: (t, string) => t = "deleteValue"
    @send external getValue: (t, string) => 'a = "getValue"
    @send external setValue: (t, string, 'a) => t = "setValue"
  }

  module ContextManager = {
    type t

    @send external active: t => Context.t = "active"
    @send external bind: (t, Context.t, 'a) => 'a = "bind"
    @send external disable: t => t = "disable"
    @send external enable: t => t = "disable"
  }

  module Attributes = {
    type t<'a> = Map(Js.Dict.t<'a>)
  }

  module IArrayValue = {
    type t<'a> = {values: array<'a>}
  }

  module IKeyValueList = {
    type t
  }

  module IAnyValue = {
    type rec t = {
      arrayValue?: IArrayValue.t<t>,
      boolValue?: Js.Nullable.t<bool>,
      bytesValue?: Uint8Array.t,
      doubleValue?: Js.Nullable.t<float>,
      intValue?: Js.Nullable.t<int>,
      kvlistValue?: IKeyValueList.t,
      stringValue?: Js.Nullable.t<string>,
    }
  }

  module IKeyValue = {
    type t = {
      key: string,
      value: IAnyValue.t,
    }
  }

  module IResource = {
    type t = {
      attributes: array<IKeyValue.t>,
      droppedAttributesCount?: int,
    }
  }

  module HrTime = {
    type t = Time(array<float>)
  }

  module SpanStatusCode = {
    type t =
      | @int(2) Error
      | @int(1) Ok
      | @int(0) Unset
  }

  module SpanStatus = {
    type t = {
      code: SpanStatusCode.t,
      message?: string,
    }
  }

  module TraceState = {
    type t

    @send external get: string => option<string> = "get"
    @send external serialize: unit => string = "serialize"
    @send external set: (string, string) => t = "set"
    @send external unset: string => t = "unset"
  }

  module SpanContext = {
    type t = {
      isRemote?: bool,
      spanId: string,
      traceFlags: int,
      traceId: string,
      traceState?: TraceState.t,
    }
  }

  module Link = {
    type t<'a> = {
      attributes?: Attributes.t<'a>,
      context: SpanContext.t,
      droppedAttributesCount?: int,
    }
  }

  module SpanKind = {
    type t =
      | @int(2) Client
      | @int(4) Consumer
      | @int(0) Internal
      | @int(3) Producer
      | @int(1) Server
  }

  module InstrumentationLibrary = {
    type t = {
      name: string,
      schemaUrl?: string,
      version?: string,
    }
  }

  module TimedEvent = {
    type t

    @get external attributes: t => option<Attributes.t<'a>> = "attributes"
    @get external droppedAttributesCount: t => int = "droppedAttributesCount"
    @get external name: t => string = "name"
    @get external time: t => HrTime.t = "time"
  }

  module ReadableSpan = {
    type t

    @get external attibutes: t => Attributes.t<'a> = "attributes"
    @get external droppedAttributesCount: t => int = "droppedAttributesCount"
    @get external droppedEventsCount: t => int = "droppedEventsCount"
    @get external droppedLinksCount: t => int = "droppedLinksCount"
    @get external duration: t => HrTime.t = "duration"
    @get external endTime: t => HrTime.t = "endTime"
    @get external ended: t => bool = "ended"
    @get external events: t => array<TimedEvent.t> = "events"
    @get external instrumentationLibrary: t => InstrumentationLibrary.t = "instrumentationLibrary"
    @get external kind: t => array<SpanKind.t> = "kind"
    @get external links: t => array<Link.t<'a>> = "links"
    @get external name: t => string = "name"
    @get external parentSpanId: t => option<string> = "parentSpanId"
    @get external resource: t => IResource.t = "resource"
    @get external startTime: t => HrTime.t = "startTime"
    @get external status: t => SpanStatus.t = "status"
    @send external spanContext: t => SpanContext.t = "spanContext"
  }

  module SpanExporter = {
    type t

    @send external export: (t, array<ReadableSpan.t>, 'a) => unit = "export"

    @send external forceFlush: t => Promise.t<unit> = "forceFlush"

    @send external shutdown: t => Promise.t<unit> = "shutdown"
  }
}

module UpgradeWebSocketOptions = {
  type t = {
    protocol?: string,
    idleTimeout?: int,
  }
}

module BinaryType = {
  type t =
    | Arraybuffer
    | Blob
}

module ArrayBufferLike = {
  type t
}

module Blob = {
  type t = {
    size: int,
    @as("type")
    type_: string,
  }

  @send external arrayBuffer: t => Promise.t<ArrayBuffer.t> = "arrayBuffer"
  @send external bytes: t => Uint8Array.t = "bytes"
  @send external slice: (t, ~start: int=?, ~end: int=?, ~contentType: string=?) => t = "slice"
  @send external stream: t => ReadableStream.t<Uint8Array.t> = "stream"
  @send external text: t => Promise.t<string> = "text"
}

module ArrayBufferView = {
  type t
}

module WebSocketData = {
  type t =
    | String(string)
    | ArrayBufferLike(ArrayBufferLike.t)
    | Blob(Blob.t)
    | ArrayBufferView(ArrayBufferView.t)
}

module AddEventListenerOptions = {
  type t = {
    once?: bool,
    passive?: bool,
    signal?: AbortSignal.t,
  }
}

module EventListenerOptions = {
  type t = {capture?: bool}
}

module WebSocket = {
  type t = {
    binaryType: BinaryType.t,
    bufferedAmount: int,
    extensions: string,
    protocol: string,
    readyState: int,
    url: string,
    @as("CLOSED")
    closed: int,
    @as("CLOSING")
    closing: int,
    @as("CONNECTING")
    connecting: int,
    @as("OPEN")
    open_: int,
  }

  @send external close: (t, ~code: int=?, ~reason: string=?) => unit = "close"
  @send external send: (t, WebSocketData.t) => unit = "send"
  @send
  external addEventListener: (t, 'a, 'b, ~options: AddEventListenerOptions.t=?) => unit =
    "addEventListener"
  @send
  external removeEventListener: (t, 'a, 'b, ~options: EventListenerOptions.t=?) => unit =
    "removeEventListener"
}

module WebSocketUpgrade = {
  type t = {
    response: Response.t,
    socker: WebSocket.t,
  }
}

@scope("Deno")
external upgradeWebSocket: (
  Request.t,
  ~options: UpgradeWebSocketOptions.t=?,
) => WebSocketUpgrade.t = "upgradeWebSocket"

module Writer = {
  type t = {writable: WritableStream.t<Uint8Array.t>}

  @send external write: (t, Uint8Array.t) => Promise.t<int> = "write"
  @send external writeSync: (t, Uint8Array.t) => int = "writeSync"
  @send external close: t => unit = "close"
  @send external isTerminal: t => bool = "isTerminal"
}

module Reader = {
  type t = {readable: ReadableStream.t<Uint8Array.t>}

  @send external read: (t, Uint8Array.t) => Promise.t<Js.Nullable.t<int>> = "read"
  @send external readSync: (t, Uint8Array.t) => Js.Nullable.t<int> = "readSync"
  @send external close: t => unit = "close"
  @send external setRaw: (t, bool, ~options: SetRawOptions.t=?) => unit = "setRaw"
  @send external isTerminal: t => bool = "isTerminal"
}

@scope("Deno") @val external stderr: Writer.t = "stderr"
@scope("Deno") @val external stdout: Writer.t = "stdout"
@scope("Deno") @val external stdin: Reader.t = "stdin"

module IteratorResult = {
  type t<'a>
}

module Symbol = {
  type t
}

module KvU64 = {
  type t = {value: int}
  @new external new: int => t = "KvU64"
}

module CronScheduleExpression = {
  type y =
    | Number(int)
    | NumberArray(array<int>)

  type u = {exact: y}

  type v = {
    start?: int,
    end?: int,
    every?: int,
  }

  type t =
    | Number(int)
    | Exact(u)
    | Range(v)

  let unwrap = (expression: t) => {
    switch expression {
    | Number(value) => Obj.magic(value)
    | Exact(value) =>
      Obj.magic({
        exact: switch value.exact {
        | Number(value) => Obj.magic(value)
        | NumberArray(value) => Obj.magic(value)
        },
      })
    | Range(value) => Obj.magic(value)
    }
  }
}

module CronSchedule = {
  type t = {
    minute?: CronScheduleExpression.t,
    hour?: CronScheduleExpression.t,
    dayOfMonth?: CronScheduleExpression.t,
    month?: CronScheduleExpression.t,
    dayOfWeek?: CronScheduleExpression.t,
  }

  let unwrap = (schedule: t) => {
    minute: switch schedule.minute {
    | Some(minute) => minute->CronScheduleExpression.unwrap
    | None => Obj.magic(undefined)
    },
    hour: switch schedule.hour {
    | Some(hour) => hour->CronScheduleExpression.unwrap
    | None => Obj.magic(undefined)
    },
    dayOfMonth: switch schedule.dayOfMonth {
    | Some(dayOfMonth) => dayOfMonth->CronScheduleExpression.unwrap
    | None => Obj.magic(undefined)
    },
    month: switch schedule.month {
    | Some(month) => month->CronScheduleExpression.unwrap
    | None => Obj.magic(undefined)
    },
    dayOfWeek: switch schedule.dayOfWeek {
    | Some(dayOfWeek) => dayOfWeek->CronScheduleExpression.unwrap
    | None => Obj.magic(undefined)
    },
  }
}

module KvConsistencyLevel = {
  type t =
    | Strong
    | Eventual
}

module KvKeyPart = {
  type t =
    | String(string)
    | Uint8Array(Uint8Array.t)
    | Number(int)
    | Boolean(bool)

  let unwrap = (key: t) => {
    switch key {
    | String(value) => Obj.magic(value)
    | Uint8Array(value) => Obj.magic(value)
    | Number(value) => Obj.magic(value)
    | Boolean(value) => Obj.magic(value)
    }
  }
}

module KvKey = {
  type t = array<KvKeyPart.t>

  let unwrap = (key: t) => {
    key->Belt.Array.map(KvKeyPart.unwrap)->Belt.Array.map(Obj.magic)
  }
}

module KvEntry = {
  type t<'a> = {
    key: KvKey.t,
    value: 'a,
    versionstamp: string,
  }
}

module KvEntryMaybe = {
  type u = {
    key: KvKey.t,
    value: Js.Nullable.t<string>,
    versionstamp: Js.Nullable.t<string>,
  }

  type t<'a> = KvEntry(KvEntry.t<'a>) | Maybe(u)
}

module KvListIterator = {
  type t = {cursor: string}

  @send external next: t => Promise.t<IteratorResult.t<KvEntry.t<'a>>> = "next"
}

module KvListSelector = {
  type prefix = {prefix: KvKey.t}
  type prefixStart = {prefix: KvKey.t, start: KvKey.t}
  type prefixEnd = {prefix: KvKey.t, end: KvKey.t}
  type startEnd = {start: KvKey.t, end: KvKey.t}

  type t =
    | Prefix(prefix)
    | PrefixStart(prefixStart)
    | PrefixEnd(prefixEnd)
    | StartEnd(startEnd)
}

module KvMutation = {
  type set<'a> = {
    key: KvKey.t,
    @as("type")
    type_: [#set],
    value: 'a,
    expireIn?: int,
  }

  type delete = {
    key: KvKey.t,
    @as("delete")
    type_: [#delete],
  }

  type sum = {
    key: KvKey.t,
    @as("type")
    type_: [#sum],
    value: KvU64.t,
  }

  type max = {
    key: KvKey.t,
    @as("type")
    type_: [#max],
    value: KvU64.t,
  }

  type min = {
    key: KvKey.t,
    @as("type")
    type_: [#max],
    value: KvU64.t,
  }

  type t<'a> =
    | Set(set<'a>)
    | Delete(delete)
    | Sum(sum)
    | Max(max)
    | Min(min)

  let unwrap = (mutation: t<'a>) => {
    switch mutation {
    | Set(mutation) => Obj.magic(mutation)
    | Delete(mutation) => Obj.magic(mutation)
    | Sum(mutation) => Obj.magic(mutation)
    | Max(mutation) => Obj.magic(mutation)
    | Min(mutation) => Obj.magic(mutation)
    }
  }
}

module EnqueueOptions = {
  type t = {
    delay?: int,
    keysIfUndelivered?: array<KvKey.t>,
    backoffSchedule?: array<int>,
  }
}

module KvCommitResult = {
  type t = {
    ok: bool,
    versionstamp: string,
  }
}

module KvGetOptions = {
  type t = {consistency?: KvConsistencyLevel.t}
}

module KvListOptions = {
  type t = {
    limit?: int,
    cursor?: string,
    reverse?: bool,
    consistency?: KvConsistencyLevel.t,
    batchSize?: int,
  }
}

module KvListenQueueHandler = {
  type t<'a> =
    | Fn('a => Promise.t<unit>)
    | Void(unit)
  let unwrap = (handler: t<'a>) => {
    switch handler {
    | Fn(handler) => Obj.magic(handler)
    | Void(_) => ()
    }
  }
}

module KvSetOptions = {
  type t = {expireInt?: int}
}

module KvWatchOptions = {
  type t = {raw?: bool}
}

module AtomicCheck = {
  type t = {
    key: KvKey.t,
    versionstamp: Js.Nullable.t<string>,
  }
}

module AtomicOperation = {
  type t

  @send @variadic external check: (t, array<AtomicCheck.t>) => t = "check"
  @send external commit: t => Promise.t<KvCommitResult.t> = "commit"
  @send external delete: (t, KvKey.t) => t = "delete"
  @send external enqueue: (t, 'a, ~options: EnqueueOptions.t=?) => t = "enqueue"
  @send external max: (t, int) => t = "max"
  @send external min: (t, int) => t = "min"
  @send @variadic external mutate: (t, array<KvMutation.t<'a>>) => t = "mutate"
  @send external set: (t, ~key: KvKey.t, ~value: 'a, ~options: KvSetOptions.t=?) => t = "set"
  @send external sum: (t, KvKey.t, int) => t = "sum"
}

module Kv = {
  type t

  @send external atomic: t => AtomicOperation.t = "atomic"
  @send external close: t => unit = "close"
  @send external commitVersionstamp: t => Symbol.t = "commitVersionstamp"
  @send external delete: (t, KvKey.t) => Promise.t<unit> = "delete"
  @send
  external enqueue: (t, 'a, ~options: EnqueueOptions.t=?) => Promise.t<KvCommitResult.t> = "enqueue"
  @send
  external get: (t, KvKey.t, ~options: KvGetOptions.t=?) => Promise.t<KvEntry.t<'a>> = "get"
  @send
  external getMany: (
    t,
    array<array<KvKey.t>>,
    ~options: KvGetOptions.t=?,
  ) => Promise.t<array<KvEntry.t<'a>>> = "getMany"
  @send
  external list: (t, KvListSelector.t, ~options: KvListOptions.t=?) => KvListIterator.t = "list"
  @send external listenQueue: (t, KvListenQueueHandler.t<'a>) => Promise.t<unit> = "listenQueue"

  @send
  external set: (
    t,
    ~key: KvKey.t,
    ~value: 'a,
    ~options: KvSetOptions.t=?,
  ) => Promise.t<KvCommitResult.t> = "set"
  @send
  external watch: (t, array<array<KvKey.t>>, ~options: KvWatchOptions.t=?) => ReadableStream.t<'a> =
    "watch"
}

module Schedule = {
  type t =
    | String(string)
    | CronSchedule(CronSchedule.t)

  let unwrap = (schedule: t) => {
    switch schedule {
    | String(value) => Obj.magic(value)
    | CronSchedule(value) => Obj.magic(value)
    }
  }
}

module CronHandler = {
  type t = Fn(unit => Promise.t<unit>) | Void(unit)

  let unwrap = (handler: t) => {
    switch handler {
    | Fn(handler) => Obj.magic(handler)
    | Void(_) => Obj.magic()
    }
  }
}

@scope("Deno") external openKv: (~path: string=?) => Promise.t<Kv.t> = "openKv"
@scope("Deno") external cron: (string, Schedule.t, CronHandler.t) => Promise.t<unit> = "cron"
