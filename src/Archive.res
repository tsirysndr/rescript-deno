open IO
module Tar = {
  type t
  type tarOptions = {filePath?: string, reader: Buffer.t, contentSize: int}

  @send external append: (t, string, tarOptions) => unit = "append"

  @send
  external getReader: t => Types.Reader.t = "getReader"

  @new @module("https://deno.land/std@0.212.0/archive/tar.ts") external newTar: unit => t = "Tar"
}

module Untar = {
  type t

  module TarEntry = {
    type t

    @new @module("https://deno.land/std@0.212.0/archive/untar.ts")
    external newTarEntry: Uint8Array.t => t = "TarEntry"

    @send external discard: t => unit = "discard"

    @send external read: Uint8Array.t => Promise.t<int> = "read"
  }

  @new @module("https://deno.land/std@0.212.0/archive/untar.ts")
  external newUntar: Types.Reader.t => t = "Untar"

  @send external extract: t => Promise.t<TarEntry.t> = "extract"
}
