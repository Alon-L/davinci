defmodule Davinci.TokenList do
  use GenServer

  def start_link() do
    GenServer.start_link(__MODULE__, [])
  end

  def start_link(list) when is_binary(list) do
    GenServer.start_link(__MODULE__, list)
  end

  def insert(pid, %Davinci.Token{} = token) do
    GenServer.cast(pid, {:insert, token})
  end

  def peek(pid) do
    GenServer.call(pid, :peek)
  end

  def consume(pid) do
    GenServer.call(pid, :consume)
  end

  def restore(pid) do
    GenServer.cast(pid, :restore)
  end

  @impl true
  def init(init_list) do
    {:ok, {init_list, init_list}}
  end

  @impl true
  def handle_cast({:insert, %Davinci.Token{} = token}, {all_tokens, tokens}) do
    {:noreply, {all_tokens ++ [token], tokens ++ [token]}}
  end
  
  @impl true
  def handle_cast(:restore, {all_tokens, _}) do
    {:noreply, {all_tokens, all_tokens}}
  end

  @impl true
  def handle_call(:peek, _from, {all_tokens, [next | rest]}) do
    {:reply, next, {all_tokens, [next | rest]}}
  end

  @impl true
  def handle_call(:consume, _from, {all_tokens, [next | rest]}) do
    {:reply, next, {all_tokens, rest}}
  end
end
