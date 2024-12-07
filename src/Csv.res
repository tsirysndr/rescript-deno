open Globals

module ParseOptions = {
  type t = {
    separator?: string,
    comment?: string,
    trimLeadingSpace?: bool,
    lazyQuotes?: bool,
    fieldsPerRecord?: int,
    skipFirstRow?: bool,
    columns?: Belt.Array.t<string>,
  }
}

@module("jsr:@std/csv")
external parse: (string, ~options: ParseOptions.t=?) => Belt.Array.t<Belt.Array.t<string>> = "parse"

module PropertyAccessor = {
  type t = Number(int) | String(string)
}

module ColumnDetailsPropertyAccessor = {
  type t =
    | PropertyAccessor(PropertyAccessor.t)
    | PropertyAccessorArray(Belt.Array.t<PropertyAccessor.t>)
}

module ColumnDetails = {
  type t = {
    header?: string,
    prop: ColumnDetailsPropertyAccessor.t,
  }
}

module Column = {
  type t =
    | ColumnDetails
    | PropertyAccessor
    | PropertyAccessorArray
}

module StringifyOptions = {
  type t = {
    headers?: bool,
    separator?: string,
    columns?: Belt.Array.t<Column.t>,
    bom?: bool,
  }
}

@module("jsr:@std/csv")
external stringify: (Belt.Array.t<'a>, ~options: StringifyOptions.t=?) => string = "stringify"

module ParseResult = {
  type t =
    | StringArray(Belt.Array.t<Belt.Array.t<string>>)
    | RecordArray(Belt.Array.t<Js.Dict.t<string>>)
}

module RowType = {
  type t =
    | StringArray(Belt.Array.t<string>)
    | ParseResult(Belt.Array.t<ParseResult.t>)
}

module CsvParseStreamOptions = {
  type t = {
    separator?: string,
    comment?: string,
    trimLeadingSpace?: bool,
    lazyQuotes?: bool,
    fieldsPerRecord?: int,
    skipFirstRow?: bool,
    columns?: Belt.Array.t<string>,
  }
}

module CsvParseStream = {
  type t

  @new @module("jsr:@std/csv/parse-stream")
  external new: (~options: CsvParseStreamOptions.t=?) => t = "CsvParseStream"

  @send external readable: t => ReadableStream.t<RowType.t> = "readable"

  @send external writable: t => WritableStream.t<string> = "writable"
}

module CsvStringifyStreamOptions = {
  type t = {
    separator?: string,
    columns?: Belt.Array.t<string>,
  }
}

module CsvStringifyStream = {
  type t

  @new @module("jsr:@std/csv/stringify-stream")
  external new: (~options: CsvStringifyStreamOptions.t=?) => t = "CsvStringifyStream"
}
