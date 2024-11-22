defmodule TokenListTest do
  use ExUnit.Case, async: true
  
  alias Davinci.TokenList

  setup do
    {:ok, pid} = TokenList.start_link()
    {:ok, pid: pid}
  end

  @token1 %Davinci.Token{type: :eof, start_idx: 0, end_idx: 0}
  @token2 %Davinci.Token{type: :start, start_idx: 0, end_idx: 0}

  test "insert and consume", %{pid: pid} = _context do
    assert TokenList.insert(pid, @token1) == :ok
    assert TokenList.consume(pid) == @token1
  end

  test "insert and peek", %{pid: pid} = _context do
    assert TokenList.insert(pid, @token1) == :ok
    assert TokenList.peek(pid) == @token1
  end

  test "peek does not consume", %{pid: pid} = _context do
    assert TokenList.insert(pid, @token1) == :ok
    assert TokenList.peek(pid) == @token1
    assert TokenList.consume(pid) == @token1
  end

  test "multiple insert", %{pid: pid} = _context do
    assert TokenList.insert(pid, @token1) == :ok
    assert TokenList.insert(pid, @token2) == :ok
    assert TokenList.peek(pid) == @token1
    assert TokenList.consume(pid) == @token1
    assert TokenList.consume(pid) == @token2
  end

  test "restore consumed tokens", %{pid: pid} = _context do
    assert TokenList.insert(pid, @token1) == :ok
    assert TokenList.insert(pid, @token2) == :ok
    assert TokenList.consume(pid) == @token1
    assert TokenList.restore(pid) == :ok
    assert TokenList.consume(pid) == @token1
    assert TokenList.consume(pid) == @token2
  end
end
