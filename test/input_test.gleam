import gleam/io
import input.{input}

pub fn main() {
  // I just run this on all four non browser runtimes: erlang, node, deno, bun
  let assert Ok(my_input) = input("Hello: ")
  io.println("\"" <> my_input <> "\"")
}
