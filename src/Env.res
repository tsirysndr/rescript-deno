type t

@send external get: (t, string) => option<string> = "get"

@send external set: (t, string, string) => unit = "set"

@send external delete: (t, string) => unit = "delete"

@send external has: (t, string) => bool = "has"
