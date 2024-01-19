module Types = {
  module Reader = {
    type t
    @module("https://deno.land/std@0.212.0/io/types.ts")
    external read: Uint8Array.t => Promise.t<option<int>> = "read"
  }
}

module Buffer = {
  type t

  @new @module("https://deno.land/std@0.212.0/io/buffer.ts")
  external new: Uint8Array.t => t = "Buffer"

  @send external empty: t => bool = "empty"

  @send external bytes: t => Uint8Array.t = "bytes"
}
