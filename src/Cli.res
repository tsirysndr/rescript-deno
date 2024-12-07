module TDoubleDash = {
  type t = Boolean(bool)
}

module TAliases = {
  type t = Aliases(Js.Dict.t<string>)
}

module TBooleans = {
  type t =
    | Boolean(bool)
    | String(string)
    | Strings(Belt.Array.t<string>)
}

module TStrings = {
  type t = String(string) | Strings(Belt.Array.t<string>)
}

module TCollectable = {
  type t = String(string) | Strings(Belt.Array.t<string>)
}

module TNegatable = {
  type t = String(string) | Strings(Belt.Array.t<string>)
}

module TDefault = {
  type t = Default(Js.Dict.t<string>)
}

module ParseOptions = {
  type t = {
    "--": option<TDoubleDash.t>,
    "alias": option<TAliases.t>,
    "boolean": option<TBooleans.t>,
    "default": option<TDefault.t>,
    "stopEarly": option<bool>,
    "string": option<TStrings.t>,
    "collect": option<TCollectable.t>,
    "negatable": option<TNegatable.t>,
    "unknown": option<(string, ~key: string=?, ~value: string=?) => string>,
  }
}

module Args = {
  type t<'a> = Args(Js.Dict.t<'a>)
}

@module("jsr:@std/cli")
external parseArgs: (Belt.Array.t<string>, ~options: ParseOptions.t=?) => Args.t<'a> = "parseArgs"

module PromptSecretOptions = {
  type t = {
    mask?: string,
    clear?: bool,
  }
}

module Nullable = {
  type t<'a> = Null | String(string)
}

@module("jsr:@std/cli")
external promptSecret: (
  ~message: string=?,
  ~options: PromptSecretOptions.t=?,
) => Nullable.t<string> = "promptSecret"

@module("jsr:@std/cli/unicode-width")
external unicodeWidth: string => int = "unicodeWidth"
