defmodule TokenListTest do
  use ExUnit.Case, async: true
  
  alias Davinci.TokenList

  setup do
    {:ok, pid} = TokenList.start_link()
    {:ok, pid: pid}
  end

  @token %Davinci.Token{type: :eof, start_idx: 0, end_idx: 0}

  test "insert and pop", %{pid: pid} = _context do
    assert TokenList.push(pid, @token) == :ok
    assert TokenList.pop_next(pid) == @token
  end

  test "insert and peek", %{pid: pid} = _context do
    assert TokenList.push(pid, @token) == :ok
    assert TokenList.peek_next(pid) == @token
  end

  test "peek does not pop", %{pid: pid} = _context do
    assert TokenList.push(pid, @token) == :ok
    assert TokenList.peek_next(pid) == @token
    assert TokenList.pop_next(pid) == @token
  end
end
