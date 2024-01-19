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
}
