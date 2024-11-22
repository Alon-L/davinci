defmodule DavinciTest do
  use ExUnit.Case
  doctest Davinci

  test "greets the world" do
    assert Davinci.hello() == :world
  end
end
