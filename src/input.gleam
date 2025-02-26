//// This package provides a single function, `input`, that prints a prompt
//// and then reads a user's input. Inspired by the Python function of the
//// same name.
//// It is intended to work on erlang, node, deno, and bun.
//// This package has no dependencies, not even the stdlib.

@external(erlang, "input_ffi", "input")
@external(javascript, "./input_ffi.mjs", "input")
pub fn input(prompt prompt: String) -> Result(String, Nil)
