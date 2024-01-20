open Archive.Tar
open Archive.Untar
open IO
open Globals
open Assert

Console.log("Hello, world!")
Console.log(Deno.env->Env.get("HOME"))
Console.log(Deno.env->Env.has("PATH"))

let tar = newTar()
let content = TextEncoder.new()->TextEncoder.encode("hello")

let b = Buffer.new(content)

Console.log(b->Buffer.empty)
Console.log(b->Buffer.bytes)

tar->append("hello.txt", {reader: b, contentSize: b->Buffer.bytes->TypedArray.length})

Console.log(tar)

Console.log(tar->getReader)

let reader = tar->getReader

let untar = newUntar(reader)

Console.log(await untar->extract)

_assert(true)

assertAlmostEquals(0.01, 0.02, ~tolerance=0.1)

assertArrayIncludes([1, 2, 3], [1, 2])

assertEquals(1, 1)

let a = 1

assertExists(a)

assertFalse(false)

assertGreater(4, 1)

assertGreaterOrEqual(4, 4)

assertLess(1, 4)

assertLessOrEqual(4, 4)

assertMatch("hello", %re("/hello/"))

assertNotEquals(1, 2)

assertNotMatch("hello", %re("/world/"))

assertNotStrictEquals(1, 2)

type x = {a: int}

assertObjectMatch({a: 1}, {a: 1})

let z = {a: 1}
let y = z
assertStrictEquals(y, z)

assertStringIncludes("hello", "ello")

exception MyException({message: string})

assertThrows(() => {
  raise(MyException({message: "hello"}))
})

Console.log(equal({a: 1}, {a: 1}))

let c = AbortController.new()

Console.log(c->AbortController.signal)

Console.log(URL.new("https://deno.land")->URL.toString)

let pattern = URLPattern.new(String("https://deno.land"))

Console.log(pattern)

let pattern = URLPattern.new(
  URLPatternInit({
    pathname: "/x",
    baseURL: "https://deno.land",
  }),
)

Console.log(pattern)

Deno.exit(0)
