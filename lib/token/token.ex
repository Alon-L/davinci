defmodule Davinci.Token do
  @type token_type() :: :literal

  @enforce_keys [:type, :start_idx, :end_idx]
  defstruct [:type, :lookahead, :start_idx, :end_idx]
end
