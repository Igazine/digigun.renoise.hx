## Haxe externs for Renoise Scripting (Lua)

Work in progress

### Installation

Install the Haxe library with the following terminal command:

```
haxelib git digigun.renoise.hx https://github.com/Igazine/digigun.renoise.hx
```

### Differences between the Lua and the Haxe implementation

#### Arrays

Lua arrays are basically integer-indexed tables. In Haxe, these Lua arrays are converted to Haxe arrays for easier handling and manipulation in getters, setters and any function arguments.

Therefore ensure the modified array is written back to the previously retrieved reference. Eg:

```haxe
final comments = instrument.comments;
comments.push("My new comment");
// Directly editing the array has no effect on the comments property,
// so make sure it's properly set
instrument.comments = comments;

```