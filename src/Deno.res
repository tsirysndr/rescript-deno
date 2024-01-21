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

module SeekMode = {
  type t = Start | Current | End
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
