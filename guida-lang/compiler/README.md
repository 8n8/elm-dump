# Guida programming language

Guida is a functional programming language that builds upon the solid foundation of Elm, offering
backward compatibility with all existing Elm 0.19.1 projects.

# Vision

Guida builds on the foundations of Elm, aiming to advance the future of functional programming.
By translating Elm's compiler from Haskell to a self-hosted environment, Guida helps developers to
build reliable, maintainable, and performant applications without leaving the language they love.

**Continuity and Confidence (Version 1.x):**
Guida starts by ensuring full backward compatibility with Elm v0.19.1, allowing developers to migrate
effortlessly and explore Guida with complete confidence.

This commitment to continuity means that this version will faithfully replicate not only the
features and behaviors of Elm v0.19.1, but also any existing bugs and quirks.
By doing so, we provide a stable and predictable environment for developers, ensuring that their
existing Elm projects work exactly as expected when migrated to Guida.

**Evolution and Innovation (Version 2.x and Beyond):**
As Guida evolves, we will introduce new features and improvements.
This phase will foster a unified ecosystem that adapts to the needs of its users.

**Core Principles:**

- **Backward Compatibility:** Respect for existing Elm projects, ensuring a frictionless migration.
- **Accessibility:** Lowering barriers for developers by implementing Guida’s core in its own syntax.

Our ultimate goal is to create a language that inherits the best aspects of Elm while adapting and
growing to meet the needs of its users.

# Development

Start by installing [Node Version Manager](https://github.com/nvm-sh/nvm).

Switch to the correct node version number by running:

```
nvm use
```

Install the dependencies:

```
npm install
```

Generate guida:

```
npm run build
```

Link the project to run `guida` command:

```
npm link
```

You should now be able to run `guida`:

```
guida --help
```

# Examples

To run an example `cd` into the `examples` folder, and run the `guida make` command:

```
cd examples
guida make --debug src/Hello.elm
```

You can then `open index.html`.

## Clear cache

To clear all cache and re-generate `./bin/guida.js` run the following:

```
rm -rf ~/.guida guida-stuff; npm run build
```

# Run tests

Run all tests:

```
npm test
```

Run `jest` tests:

```
npm test:jest
```

Run `elm-test` tests:

```
npm run test:elm
```

Run `elm-review` tests:

```
npm run test:elm-review
```

Run `elm-format` validation:

```
npm run test:elm-format-validate
```

# Format elm source code

```
npm run elm-format
```

# References

- Initial transpilation from Haskell to Elm done based on [Elm compiler v0.19.1](https://github.com/elm/compiler/releases/tag/0.19.1)
  (more specifically [commit c9aefb6](https://github.com/elm/compiler/commit/c9aefb6230f5e0bda03205ab0499f6e4af924495))
- Terminal logic implementation based on https://github.com/albertdahlin/elm-posix

# Resources

- [Hoogle](https://hoogle.haskell.org/)
- [Online Haskell Compiler](https://www.tutorialspoint.com/compile_haskell_online.php)