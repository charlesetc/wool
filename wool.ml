open Core
open Feather

let basedir = "/Users/charles/code"

let () =
  match
    find ~depth:1 ~kind:`Directories basedir
    |. map_lines ~f:Filename.basename
    |> fzf
  with
  | None -> exit 1
  | Some result ->
      let tmux_name =
        result |> String.substr_replace_all ~pattern:"." ~with_:"-"
      in
      if Option.is_some (Sys.getenv "TMUX") then
        process "tmux" [ "rename-session"; tmux_name ] |> run;
      print_endline (Filename.concat basedir result)
