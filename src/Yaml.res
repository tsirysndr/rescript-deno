module SchemaType = {
  type t =
    | Failsafe
    | Json
    | Core
    | Default
    | Extended
}

module Error = {
  type t = {
    name: string,
    message: string,
    stack: string,
  }
}

module ParseOptions = {
  type t = {
    schema: SchemaType.t,
    allowDuplicateKeys?: bool,
  }

  @send external onWarning: (t, Error.t) => unit = "onWarning"
}

@module("jsr:@std/yaml")
external parse: (string, ~options: ParseOptions.t=?) => 'a = "parse"

@module("jsr:@std/yaml")
external parseAll: (string, ~options: ParseOptions.t=?) => 'a = "parseAll"

module StylesVariant = {
  type t =
    | Lowercase
    | Uppercase
    | Camelcase
    | Decimal
    | Binary
    | Octal
    | Hexadecimal
}

module StringifyOptions = {
  type t = {
    indent?: int,
    arrayIndent?: bool,
    skipInvalid?: bool,
    flowLevel?: int,
    styles?: Js.Dict.t<StylesVariant.t>,
    schema?: SchemaType.t,
    sortKeys?: bool,
    lineWidth?: int,
    useAnchors?: bool,
    compatMode?: bool,
    condenseFlow?: bool,
  }
}

@module("jsr:@std/yaml")
external stringify: ('a, ~options: StringifyOptions.t=?) => string = "stringify"
