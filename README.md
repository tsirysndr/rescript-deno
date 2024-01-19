# rescript-deno

Use [Deno](https://deno.com/) with [ReScript](https://rescript-lang.org/).

> Note: This is a work in progress. 🏗️🚧
>
> Project Status: 🐲 Unstable, alpha-ish quality.

🚚 Install

You need to be on at least a recent RC of ReScript v11.

```sh
npm i rescript-deno @rescript/core
```

Include them in your `rescript.json`:

```json
{
  "bs-dependencies": ["@rescript/core", "rescript-deno"]
}
```

`rescript-deno` is [namespaced](https://rescript-lang.org/docs/manual/latest/build-configuration#name-namespace), so you'll find all modules listed under the main module `RescriptDeno`.

**You're strongly encouraged to open `RescriptDeno` globally, to get the best possible developer experience.** You do that by adding this to your `rescript.json`:

```json
{
  "bsc-flags": [
    "-open RescriptCore",
    "-open RescriptDeno",
    "-open RescriptDeno.Globals"
  ]
}
```

This might be a matter of taste, but I recommend opening it to get the best experience.

This will make all of Deno available to you without needing to dip into the `RescriptDeno` module explicitly.