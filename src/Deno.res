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
