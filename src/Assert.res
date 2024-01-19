module AssertError = {
  type t

  @new @module("https://deno.land/std@0.212.0/assert/mod.ts")
  external new: string => t = "AssertionError"
}

@module("https://deno.land/std@0.212.0/assert/mod.ts") external _assert: 'a => unit = "assert"

@module("https://deno.land/std@0.212.0/assert/mod.ts")
external assertAlmostEquals: (float, float, ~tolerance: float=?, ~msg: string=?) => unit =
  "assertAlmostEquals"

@module("https://deno.land/std@0.212.0/assert/mod.ts")
external assertArrayIncludes: ('a, 'a, ~msg: string=?) => unit = "assertArrayIncludes"

@module("https://deno.land/std@0.212.0/assert/mod.ts")
external assertEquals: ('a, 'a, ~msg: string=?, ~options: 'b=?) => unit = "assertEquals"

@module("https://deno.land/std@0.212.0/assert/mod.ts")
external assertExists: ('a, ~msg: string=?) => unit = "assertExists"

@module("https://deno.land/std@0.212.0/assert/mod.ts")
external assertFalse: ('a, ~msg: string=?) => unit = "assertFalse"

@module("https://deno.land/std@0.212.0/assert/mod.ts")
external assertGreater: ('a, 'a, ~msg: string=?) => unit = "assertGreater"

@module("https://deno.land/std@0.212.0/assert/mod.ts")
external assertGreaterOrEqual: ('a, 'a, ~msg: string=?) => unit = "assertGreaterOrEqual"

@module("https://deno.land/std@0.212.0/assert/mod.ts")
external assertLess: ('a, 'a, ~msg: string=?) => unit = "assertLess"

@module("https://deno.land/std@0.212.0/assert/mod.ts")
external assertLessOrEqual: ('a, 'a, ~msg: string=?) => unit = "assertLessOrEqual"

@module("https://deno.land/std@0.212.0/assert/mod.ts")
external assertMatch: (string, Js.Re.t, ~msg: string=?) => unit = "assertMatch"

@module("https://deno.land/std@0.212.0/assert/mod.ts")
external assertNotEquals: ('a, 'a, ~msg: string=?) => unit = "assertNotEquals"

@module("https://deno.land/std@0.212.0/assert/mod.ts")
external assertNotMatch: (string, Js.Re.t, ~msg: string=?) => unit = "assertNotMatch"

@module("https://deno.land/std@0.212.0/assert/mod.ts")
external assertNotStrictEquals: ('a, 'a, ~msg: string=?) => unit = "assertNotStrictEquals"

@module("https://deno.land/std@0.212.0/assert/mod.ts")
external assertObjectMatch: ('a, 'a, ~msg: string=?) => unit = "assertObjectMatch"

@module("https://deno.land/std@0.212.0/assert/mod.ts")
external assertStrictEquals: ('a, 'a, ~msg: string=?) => unit = "assertStrictEquals"

@module("https://deno.land/std@0.212.0/assert/mod.ts")
external assertStringIncludes: (string, string, ~msg: string=?) => unit = "assertStringIncludes"

@module("https://deno.land/std@0.212.0/assert/mod.ts")
external assertThrows: (unit => 'a, ~msg: string=?) => unit = "assertThrows"

@module("https://deno.land/std@0.212.0/assert/mod.ts")
external equal: ('a, 'a) => bool = "equal"
