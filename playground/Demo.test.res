open Assert

Deno.test({
  name: "example test",
  fn: Fn(
    () => {
      assertEquals("world", "world")
    },
  ),
})
