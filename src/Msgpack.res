module ValueType = {
  type rec t =
    | Number(float)
    | String(string)
    | BigInt(int)
    | Boolean(bool)
    | Null
    | Uint8Array(Uint8Array.t)
    | Array(array<t>)
    | ValueMap(Js.Dict.t<t>)
}

@module("jsr:@std/msgpack")
external decode: Uint8Array.t => ValueType.t = "decode"

@module("jsr:@std/msgpack")
external encode: ValueType.t => Uint8Array.t = "encode"
