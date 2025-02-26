# input

This package provides a single function, `input`, that prints a prompt
and then reads a user's input. Inspired by the Python function of the
same name.

It is intended to work on erlang, node, deno, and bun.
This package has no dependencies, not even the stdlib.

[![Package Version](https://img.shields.io/hexpm/v/input)](https://hex.pm/packages/input)
[![Hex Docs](https://img.shields.io/badge/hex-docs-ffaff3)](https://hexdocs.pm/input/)

```sh
gleam add input@1
```
```gleam
import input.{input}

pub fn main() {
  let assert Ok(my_input) = input(prompt: "> ")
}
```

Further documentation can be found at <https://hexdocs.pm/input>.
