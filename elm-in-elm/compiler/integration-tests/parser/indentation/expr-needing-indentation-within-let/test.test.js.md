# Snapshot report for `integration-tests/parser/indentation/expr-needing-indentation-within-let/test.test.js`

The actual snapshot is saved in `test.test.js.snap`.

Generated by [AVA](https://avajs.dev).

## Invocation

    'elm-in-elm -m src/Main.elm'

## Stderr

    `Compiled in DEV mode. Follow the advice at https://elm-lang.org/0.19.1/optimize for better performance and smaller assets.␊
    ␊
    ---------------------------␊
    -- COMPILER ERROR ---------␊
    ---------------------------␊
    Parse problem: ExpectingIn␊
      --> src/Main.elm:8:9␊
       | ␊
    8  |         + 2␊
       |         ^ ExpectingIn␊
    Context stack:␊
        InLet␊
        InExpr␊
        InValueDeclaration␊
        InDeclaration␊
        InFile src/Main.elm␊
    ␊
    `

## Stdout

    `---------------------------␊
    -- STARTING THE COMPILER --␊
    ---------------------------␊
    `