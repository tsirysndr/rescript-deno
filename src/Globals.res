module TextEncoder = {
  type t
  @send external encode: (t, string) => Uint8Array.t = "encode"
  @new external new: unit => t = "TextEncoder"
}
