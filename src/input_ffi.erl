-module(input_ffi).
-export([input/1]).

% Mimics Python's builtin `input` function.
-spec input(io:prompt()) -> {ok, unicode:unicode_binary()} | {error, nil}.
input(Prompt) ->
    case io:get_line(Prompt) of
        eof -> {error, nil};
        {error, _} -> {error, nil};
        Data when is_binary(Data) -> {ok, string:trim(Data, trailing, "\r\n")};
        Data when is_list(Data) -> {ok, string:trim(unicode:characters_to_binary(Data), trailing, "\r\n")}
    end.