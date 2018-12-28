defmodule BnetApiTest do
  use ExUnit.Case
  doctest BnetApi

  test "greets the world" do
    assert BnetApi.hello() == :world
  end
end
