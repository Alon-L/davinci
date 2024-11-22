defmodule Davinci.TokenList do
  use GenServer

  def start_link() do
    GenServer.start_link(__MODULE__, [])
  end

  def push(pid, %Davinci.Token{} = token) do
    GenServer.cast(pid, {:push, token})
  end

  def peek_next(pid) do
    GenServer.call(pid, :peek_next)
  end

  def pop_next(pid) do
    GenServer.call(pid, :pop_next)
  end

  @impl true
  def init(list) do
    {:ok, list}
  end

  @impl true
  def handle_cast({:push, %Davinci.Token{} = token}, state) do
    {:noreply, [token | state]}
  end

  @impl true
  def handle_call(:peek_next, _from, state) do
    [next | _] = state
    {:reply, next, state}
  end

  @impl true
  def handle_call(:pop_next, _from, state) do
    [next | new_state] = state
    {:reply, next, new_state}
  end
end
