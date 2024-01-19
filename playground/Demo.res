open Archive.Tar
open Archive.Untar
open IO
open Globals

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

Deno.exit(0)
