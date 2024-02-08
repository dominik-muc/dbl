(* This file is part of DBL, released under MIT license.
 * See LICENSE for details.
 *)

(** Main module for reporting errors *)

(* Author: Piotr Polesiuk, 2023,2024 *)

(** Fatal error, that aborts compilation *)
exception Fatal_error

(** Class of the error *)
type error_class =
  | FatalError
    (** Error that immediately aborts compilation *)

  | Error
    (** Regular error. Compilation will be aborted at the end of the phase. *)

  | Warning
    (** Warning. Does not abort the compilation. *)

  | Note
    (** Just note. *)

(** Report the error *)
val report : ?pos:Position.t -> cls:error_class -> string -> unit

(** Abort compilation if any error was reported. Should be called at the end
  of each phase. *)
val assert_no_error : unit -> unit

(** Reset state of reported errors. Used in REPL in case of an error. *)
val reset : unit -> unit
