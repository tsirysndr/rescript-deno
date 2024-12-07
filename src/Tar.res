open Globals

module TarStreamFile = {
  type t = {
    @as("type")
    type_: string,
    path: string,
    size: int,
    readable: ReadableStream.t<Uint8Array.t>,
  }
}

module TarStreamOptions = {
  type t = {
    mode?: int,
    uid?: int,
    gid?: int,
    mtime?: int,
    uname?: string,
    gname?: string,
    devmajor?: string,
    devminor?: string,
  }
}

module TarStreamDir = {
  type t = {
    @as("type")
    type_: string,
    path: string,
    options?: TarStreamOptions.t,
  }
}

module TarStreamInput = {
  type t = TarStreamFile(TarStreamFile.t) | TarStreamDir(TarStreamDir.t)
}

module TarStream = {
  type t

  @new @module("jsr:@std/tar/tar-stream")
  external new: unit => t = "TarStream"

  @send
  external readable: t => ReadableStream.t<Uint8Array.t> = "readable"

  @send
  external writable: t => WritableStream.t<TarStreamInput.t> = "writable"
}

@module("jsr:@jsr/tar")
external assertValidPath: string => unit = "assertValidPath"

@module("jsr:@jsr/tar")
external assertValidTarStreamOptions: TarStreamOptions.t => unit = "assertValidTarStramOptions"

module OldStyleFormat = {
  type t = {
    name: string,
    mode: int,
    uid: int,
    gid: int,
    size: int,
    mtime: int,
    typeflag: string,
    linkname: string,
  }
}

module PosixUstarFormat = {
  type t = {
    name: string,
    mode: int,
    uid: int,
    gid: int,
    size: int,
    mtime: int,
    typeflag: string,
    linkname: string,
    magic: string,
    version: string,
    uname: string,
    gname: string,
    devmajor: string,
    devminor: string,
    prefix: string,
  }
}

module TarStreamEntryHeader = {
  type t = OldStyleFormat(OldStyleFormat.t) | PosixUstarFormat(PosixUstarFormat.t)
}

module TarStreamEntry = {
  type t = {header: TarStreamEntryHeader.t}
}

module UntarStream = {
  type t

  @new @module("jsr:@std/tar/untar-stream")
  external new: unit => t = "UntarStream"

  @send
  external readable: t => ReadableStream.t<TarStreamEntry.t> = "readable"

  @send
  external writable: t => WritableStream.t<Uint8Array.t> = "writable"
}
