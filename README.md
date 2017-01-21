# hm
Hindley-Damas-Milner implementation.

There have been a bunch of toy HM implementations floating around
lately. This one aims to be production-quality (no partial code, no
typeclasses, reasonable performance), and to demonstrate a few
well-known tricks I came across while implementing a HM-based language:

- Separating constraint generation from constraint solving as per
  Heeren02
- Constraint provenance as per Lennart Augustsson, for slightly better
  error messages
- Open functors to represent types and syntax, such that we can extend
  the datatypes later
- Actually using a union-find data structure to obtain the desired
  typechecking asymptotics
- Maybe extend the calculus with Haskell-style datatypes

I found each of these techniques quite useful and hard to figure out,
so hopefully a well-documented complete implementation with associated
writeups will help someone.
