-module(input_ffi).
-export([input/1]).

% Mimics Python's builtin `input` function.
-spec input(io:prompt()) -> {ok, unicode:unicode_binary()} | {error, eof | no_data}.
input(Prompt) ->
    case io:get_line(Prompt) of
        eof -> {error, eof};
        {error, _} -> {error, no_data};
        Data when is_binary(Data) -> {ok, string:trim(Data, trailing, "\r\n")};
        Data when is_list(Data) -> {ok, string:trim(unicode:characters_to_binary(Data), trailing, "\r\n")}
    end.