defmodule TokenListTest do
  use ExUnit.Case, async: true
  
  alias Davinci.TokenList
  alias Davinci.Token

  setup do
    {:ok, token_list: %TokenList{}}
  end

  @token1 %Token{type: :eof, start_idx: 0, end_idx: 0}
  @token2 %Token{type: :start, start_idx: 0, end_idx: 0}

  test "insert and consume", %{token_list: token_list} do
    assert {:ok, token_list} = TokenList.insert(token_list, @token1)
    assert {:ok, _token_list, @token1} = TokenList.consume(token_list)
  end

  test "insert and peek", %{token_list: token_list} do
    assert {:ok, token_list} = TokenList.insert(token_list, @token1)
    assert {:ok, @token1} = TokenList.peek(token_list)
  end

  test "peek does not consume", %{token_list: token_list} do
    assert {:ok, token_list} = TokenList.insert(token_list, @token1)
    assert {:ok, @token1} = TokenList.peek(token_list)
    assert {:ok, _token_list, @token1} = TokenList.consume(token_list)
  end

  test "multiple insert", %{token_list: token_list} do
    assert {:ok, token_list} = TokenList.insert(token_list, @token1)
    assert {:ok, token_list} = TokenList.insert(token_list, @token2)
    assert {:ok, @token1} = TokenList.peek(token_list)
    assert {:ok, token_list, @token1} = TokenList.consume(token_list)
    assert {:ok, _token_list, @token2} = TokenList.consume(token_list)
  end

  test "restore consumed tokens", %{token_list: token_list} do
    assert {:ok, token_list} = TokenList.insert(token_list, @token1)
    assert {:ok, token_list} = TokenList.insert(token_list, @token2)
    assert {:ok, token_list, @token1} = TokenList.consume(token_list)
    assert {:ok, token_list} = TokenList.restore(token_list)
    assert {:ok, token_list, @token1} = TokenList.consume(token_list)
    assert {:ok, _token_list, @token2} = TokenList.consume(token_list)
  end
end
