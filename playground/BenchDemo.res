open Assert

Deno.bench({
  name: "example test",
  fn: Fn(
    _ => {
      assertEquals("world", "world")
    },
  ),
})
