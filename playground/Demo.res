open Archive.Tar
open Archive.Untar
open IO
open Globals
open Assert
open Yaml
// open Cli

// let secret = promptSecret(~message="Enter your password: ")
// Console.log(secret)

let schedule: Deno.Schedule.t = String("* * * * *")
let handler: Deno.CronHandler.t = Fn(
  async () => {
    Console.log("This will print once a minute")
  },
)

Deno.cron("log a message", schedule->Deno.Schedule.unwrap, handler->Deno.CronHandler.unwrap)->ignore

let obj = {
  "a": 10,
  "b": "hello",
}

Console.log(Deno.inspect(obj))

Console.log(Path.join(["hello", "world"]))

Console.log("Hello, world!")
Console.log(Deno.env->Env.get("HOME"))
Console.log(Deno.env->Env.has("PATH"))

Console.log("Deno KV Demo:")

let kv = await Deno.openKv()

let prefs = {
  "username": "ada",
  "theme": "dark",
  "language": "en-US",
}

let key: Deno.KvKey.t = [String("preferences"), String("ada")]

Console.log(key->Deno.KvKey.unwrap)

(await kv->Deno.Kv.set(~key=key->Deno.KvKey.unwrap, ~value=prefs))->ignore

let entry = await kv->Deno.Kv.get(key->Deno.KvKey.unwrap)

Console.log(entry)
Console.log(entry.value)

let yaml = `
  id: 1
  name: "Alice"
`

Console.log(parse(yaml))

let tar = newTar()
let content = TextEncoder.new()->TextEncoder.encode("hello")

let b = Buffer.new(content)

let obj = {
  "title": "TOML example",
  "owner": {
    "name": "Bob",
    "bio": "Bob is a cool guy",
  },
}

Console.log(Toml.stringify(obj))

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

type query = {foo: string}

let params = URLSearchParams.new({foo: "bar"})

Console.log(params->URLSearchParams.toString)

Console.log(btoa("hello"))

Console.log(atob("aGVsbG8gd29ybGQ="))

/*
alert("hello")

let res = prompt("Are you sure?")

Console.log(res)

let res = confirm("Are you sure?")

Console.log(res)

let file = await Deno.create("hello.txt")

Console.log(file)

await Deno.mkdir("hello/world", ~options={recursive: true})

await Deno.writeTextFile("hello.txt", Deno.Data.String("hello"), ~options={create: true})
*/

/*
Deno.serveWithUnixOptions({path: "/tmp/deno.sock"}, ~handler=req => {
  Response.new(String("Hello, world!"))
})->ignore
*/

/*
Deno.serve(~handler=req => {
  Response.new(String("Hello, world!"))
})->ignore
*/

/*
let result = await fetch(String("https://rickandmortyapi.com/api/character"))
Console.log(await result->Response.json)
*/

let data = FormData.new()
data->FormData.append("foo", String("bar"))

Console.log(Deno.networkInterfaces())

let request = Request.new(
  String("http://localhost:9007"),
  ~init={
    body: FormData(data),
    method: "POST",
    // headers: {"Content-Type": "application/json"},
  },
)
Console.log(request)
Console.log(await request->Request.formData)

let text = TextEncoder.new()->TextEncoder.encode("hello")
Console.log(TextDecoder.new()->TextDecoder.decode(text))

Console.log(await Deno.resolveDns("deno.land", "A"))

let command = Deno.Command.new(
  "ls",
  ~options={
    stdout: "piped",
    stderr: "piped",
  },
)

let process = command->Deno.Command.spawn
let output = await process->Deno.ChildProcess.output
let status = await process->Deno.ChildProcess.status

Console.log(status->Deno.CommandStatus.code)

let decoder = TextDecoder.new()
Console.log(decoder->TextDecoder.decode(output->Deno.CommandOutput.stdout))

Deno.serveWithOptions({port: 9007}, ~asyncHandler=async req => {
  let headers = req->Request.headers
  let body = await req->Request.text
  Console.log(headers)
  Console.log(headers->Headers.get("User-Agent"))
  Console.log(body)
  Response.new(String("Hello, world!"))
})->ignore
