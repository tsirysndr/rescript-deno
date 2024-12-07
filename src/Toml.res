@module("jsr:@std/toml")
external parse: string => 'a = "parse"

module StringifyOptions = {
  type t = {keyAlignment?: bool}
}

@module("jsr:@std/toml")
external stringify: ('a, ~options: StringifyOptions.t=?) => string = "stringify"
