module GetAvailablePortOptions = {
  type t = {preferredPort?: int}
}

@module("jsr:@std/net")
external getAvailablePort: (~options: GetAvailablePortOptions.t=?) => int = "getAvailablePort"

@module("jsr:@std/net/unstable-get-network-address")
external getNetworkAddress: (~family: string) => option<string> = "getNetworkAddress"
