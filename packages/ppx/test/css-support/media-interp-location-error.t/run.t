This test ensures the ppx generates the correct output against styled-ppx.native
If this test fail means that the module is not in sync with the ppx

  $ cat > dune-project << EOF
  > (lang dune 3.10)
  > EOF

  $ cat > dune << EOF
  > (executable
  >  (name input)
  >  (libraries styled-ppx.native)
  >  (preprocess (pps styled-ppx)))
  > EOF

  $ dune build
  File "input.re", line 2, characters 11-20:
  Error: Parse error while reading token '('
  [1]

  $ dune describe pp ./input.re | sed '1,/^];$/d'
  
  let _className = [%ocaml.error "Parse error while reading token '('"];
