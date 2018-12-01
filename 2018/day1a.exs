defmodule SomeThing do
  def get_input do
    # input = File.open("day1a.txt", [:read, :write])
    # IO.read(input, :line) |> IO.inspect
    File.open!("day1a.txt")
    |> IO.stream(:line)
    |> Enum.each(&IO.inspect/1)
  end
end

SomeThing.get_input

ExUnit.start()

defmodule SomeThingTest do
  use ExUnit.Case

  test "1" do
    assert 10 == 10
  end
end
