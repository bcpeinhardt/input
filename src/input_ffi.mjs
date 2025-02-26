import fs from "node:fs";
import { Buffer } from "node:buffer"
import { Ok, Error as GError } from "./gleam.mjs";

/**
 * Mimics Python's `input` builtin.
 * 
 * @param {string} prompt
 * @returns {string} 
 */
export function input(prompt) {
  process.stdout.write(prompt);

  // 4096 bytes is the limit for cli input in bash.
  const buffer = Buffer.alloc(4096); 
  const bytesRead = fs.readSync(0, buffer, 0, buffer.length, null);
  const input = buffer.toString('utf-8', 0, bytesRead).trim();

  if (input) {
    return new Ok(input.trim());
  } else {
    return new GError(undefined);
  }
}