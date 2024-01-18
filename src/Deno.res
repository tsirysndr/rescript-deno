type build = {
  target: string,
  arch: string,
  os: string,
  vendor: string,
  env: string,
}
@scope("Deno") @val external version: string = "version"
@scope("Deno") @val external pid: int = "pid"
@scope("Deno") @val external ppid: int = "ppid"
@scope("Deno") @val external noColor: bool = "noColor"
@scope("Deno") @val external args: array<string> = "args"
@scope("Deno") @val external mainModule: string = "mainModule"
@scope("Deno") @val external build: build = "build"
@scope("Deno") @val external env: Env.t = "env"
