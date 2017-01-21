# hm

Hindley-Damas-Milner implementation.

There have been a bunch of toy HM implementations floating around
lately, but they were not particularly useful when I set out to write
a production DSL based on HM. This toy implementation aims to be
production-quality, and to demonstrate a few well-known tricks I came
across while implementing a HM-based language:

- Separating constraint generation from constraint solving as per
  Heeren02
- Constraint provenance as per Lennart Augustsson, for slightly better
  error messages
- Open functors to represent types and syntax, such that we can extend
  the datatypes later
- AST annotations, for propagating information about the textual
  source code. In particular, recording information from a completely
  different surface language, such that our errors presented to the
  user in terms of the DSL and not the desugared core calculus.
- Actually using a union-find data structure to obtain the desired
  typechecking asymptotics
- Using QuickCheck (via Jack) to generate well-typed and ill-typed
  terms, and using these to assert useful properties
- Maybe extend the calculus with Haskell-style datatypes, since these
  can be pesky to figure out
  - Maybe not, since there's so many different ways to do it

I found each of these techniques quite useful and hard to figure out,
so hopefully a well-documented complete implementation with associated
writeups will help someone.

By 'production-quality' (a weasel word for which I am sorry), I mean:
- No partial code. No exceptions (no exceptions!)
- Reasonable performance, i.e. with the right asymptotics
- Defensive, reasonably portable Haskell (no type aliases, no open
  imports from packages we don't control, no open exports, no implicit
  Prelude, etc etc.)
- Important parts of the specification covered via property testing
  - Well-typed terms can be checked with correct type
  - Ill-typed terms never pass type checking
  - Substitution is capture-avoiding
  - Reducing a well-typed term does not change its type
