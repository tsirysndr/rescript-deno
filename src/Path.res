@module("jsr:@std/path")
external basename: (string, ~suffix: string=?) => string = "basename"

@module("jsr:@std/path")
external common: array<string> => string = "common"

@module("jsr:@std/path")
external dirname: string => string = "dirname"

@module("jsr:@std/path")
external extname: string => string = "extname"

module ParsedPath = {
  type t = {
    root: string,
    dir: string,
    base: string,
    ext: string,
    name: string,
  }
}

@module("jsr:@std/path")
external format: ParsedPath.t => string = "format"

module URL = {
  type t = {
    hash: string,
    host: string,
    hostname: string,
  }

  @new external new: (string, ~base: string=?) => t = "URL"
}

module FileURL = {
  type t = URL(URL.t) | String(string)
}

@module("jsr:@std/path")
external fromFileUrl: FileURL.t => string = "fromFileUrl"

module GlobOptions = {
  type t = {
    extended?: bool,
    globstar?: bool,
    caseInsensitive?: bool,
  }
}

module RegExp = {
  type t

  @new external new: string => t = "RegExp"

  @get external escape: string => string = "escape"

  @send external compile: (t, string) => unit = "compile"

  @send external exec: (t, string) => Js.Nullable.t<array<string>> = "exec"

  @send external test: (t, string) => bool = "test"

  @send external toString: t => string = "toString"
}

@module("jsr:@std/path")
external globToRegExp: (string, ~options: GlobOptions.t=?) => RegExp.t = "globToRegExp"

@module("jsr:@std/path")
external isAbsolute: string => bool = "isAbsolute"

@module("jsr:@std/path")
external isGlob: string => bool = "isGlob"

@module("jsr:@std/path") @variadic
external join: array<string> => string = "join"

@module("jsr:@std/path")
external joinGlobs: (array<string>, ~options: GlobOptions.t=?) => string = "joinGlobs"

@module("jsr:@std/path")
external normalize: string => string = "normalize"

@module("jsr:@std/path")
external normalizeGlob: (string, ~options: GlobOptions.t=?) => string = "normalizeGlob"

@module("jsr:@std/path")
external parse: string => ParsedPath.t = "parse"

@module("jsr:@std/path")
external relative: (string, string) => string = "relative"

@module("jsr:@std/path") @variadic
external resolve: array<string> => string = "resolve"

@module("jsr:@std/path") @val external separator: string = "SEPARATOR"

@module("jsr:@std/path") @val external separatorPattern: string = "SEPARATOR_PATTERN"

@module("jsr:@std/path") @val external delimiter: string = "DELIMITER"

@module("jsr:@std/path")
external toFileUrl: string => URL.t = "toFileUrl"

@module("jsr:@std/path")
external toNamespacedPath: string => string = "toNamespacedPath"
