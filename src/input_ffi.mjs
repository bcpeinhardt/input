import fs from "node:fs";
import { Buffer } from "node:buffer"
import { Ok, Error as GError } from "./gleam.mjs";

/**
 * Mimics Python's `input` builtin.
 * 
 * @param {string} prompt
 * @returns {Ok | GError} 
 */
export function input(prompt) {
  try {
    process.stdout.write(prompt);

    // 4096 bytes is the limit for cli input in bash.
    const buffer = Buffer.alloc(4096);
    const bytesRead = fs.readSync(0, buffer, 0, buffer.length, null);
    let input = buffer.toString('utf-8', 0, bytesRead);

    // Trim trailing newlines
    input = input.replace(/[\r\n]+$/, '');

    return new Ok(input);

  } catch {
    return new GError(undefined);
  }
}