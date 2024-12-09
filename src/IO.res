module Types = {
  module Reader = {
    type t
    @module("jsr:@std/io/types")
    external read: Uint8Array.t => Promise.t<option<int>> = "read"
  }
}

module Buffer = {
  type t

  @new @module("jsr:@std/io")
  external new: Uint8Array.t => t = "Buffer"

  @send external empty: t => bool = "empty"

  @send external bytes: t => Uint8Array.t = "bytes"
}
