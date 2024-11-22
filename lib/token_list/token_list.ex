defmodule Davinci.TokenList do
  alias Davinci.TokenList
  alias Davinci.Token

  defstruct [all_tokens: [], tokens: []]

  @spec insert(%TokenList{}, %Token{}) :: {:ok, %TokenList{}}
  def insert(%TokenList{all_tokens: all_tokens, tokens: tokens} = token_list, %Token{} = token) do
    {:ok, %TokenList{token_list | all_tokens: all_tokens ++ [token], tokens: tokens ++ [token]}}
  end

  @spec peek(%TokenList{tokens: []}) :: {:err, :empty}
  def peek(%TokenList{tokens: []}) do
    {:err, :empty}
  end

  @spec peek(%TokenList{}) :: {:ok, %Token{}}
  def peek(%TokenList{tokens: [token | _]}) do
    {:ok, token}
  end

  @spec consume(%TokenList{tokens: []}) :: {:err, :empty}
  def consume(%TokenList{tokens: []}) do
    {:err, :empty}
  end

  @spec consume(%TokenList{}) :: {:ok, %TokenList{}, %Token{}}
  def consume(%TokenList{tokens: [token | rest]} = token_list) do
    {:ok, %TokenList{token_list | tokens: rest}, token}
  end

  @spec restore(%TokenList{}) :: {:ok, %TokenList{}}
  def restore(%TokenList{all_tokens: all_tokens} = token_list) do
    {:ok, %TokenList{token_list | tokens: all_tokens}}
  end
end
