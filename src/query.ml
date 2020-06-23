open Base

type t = Q of string | D of string

let q parts = Q (String.concat ~sep:" " parts)

let d parts = D (String.concat ~sep:" " parts)

let parse input =
  let parse' = function
    | "q" :: tl -> Ok (q tl)
    | "d" :: tl -> Ok (d tl)
    | _ -> Or_error.error_string "invalid input"
  in
  String.split ~on:' ' input |> parse'

let run _state _q = (_state, None)
