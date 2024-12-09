module AssertError = {
  type t

  @new @module("jsr:@std/assert")
  external new: string => t = "AssertionError"
}

@module("jsr:@std/assert") external _assert: 'a => unit = "assert"

@module("jsr:@std/assert")
external assertAlmostEquals: (float, float, ~tolerance: float=?, ~msg: string=?) => unit =
  "assertAlmostEquals"

@module("jsr:@std/assert")
external assertArrayIncludes: ('a, 'a, ~msg: string=?) => unit = "assertArrayIncludes"

@module("jsr:@std/assert")
external assertEquals: ('a, 'a, ~msg: string=?, ~options: 'b=?) => unit = "assertEquals"

@module("jsr:@std/assert")
external assertExists: ('a, ~msg: string=?) => unit = "assertExists"

@module("jsr:@std/assert")
external assertFalse: ('a, ~msg: string=?) => unit = "assertFalse"

@module("jsr:@std/assert")
external assertGreater: ('a, 'a, ~msg: string=?) => unit = "assertGreater"

@module("jsr:@std/assert")
external assertGreaterOrEqual: ('a, 'a, ~msg: string=?) => unit = "assertGreaterOrEqual"

@module("jsr:@std/assert")
external assertLess: ('a, 'a, ~msg: string=?) => unit = "assertLess"

@module("jsr:@std/assert")
external assertLessOrEqual: ('a, 'a, ~msg: string=?) => unit = "assertLessOrEqual"

@module("jsr:@std/assert")
external assertMatch: (string, Js.Re.t, ~msg: string=?) => unit = "assertMatch"

@module("jsr:@std/assert")
external assertNotEquals: ('a, 'a, ~msg: string=?) => unit = "assertNotEquals"

@module("jsr:@std/assert")
external assertNotMatch: (string, Js.Re.t, ~msg: string=?) => unit = "assertNotMatch"

@module("jsr:@std/assert")
external assertNotStrictEquals: ('a, 'a, ~msg: string=?) => unit = "assertNotStrictEquals"

@module("jsr:@std/assert")
external assertObjectMatch: ('a, 'a, ~msg: string=?) => unit = "assertObjectMatch"

@module("jsr:@std/assert")
external assertStrictEquals: ('a, 'a, ~msg: string=?) => unit = "assertStrictEquals"

@module("jsr:@std/assert")
external assertStringIncludes: (string, string, ~msg: string=?) => unit = "assertStringIncludes"

@module("jsr:@std/assert")
external assertThrows: (unit => 'a, ~msg: string=?) => unit = "assertThrows"

@module("jsr:@std/assert")
external equal: ('a, 'a) => bool = "equal"
