defmodule SomeThing do

end

ExUnit.start()

defmodule SomeThingTest do
  use ExUnit.Case

  test "1" do
    assert 10 == 10
  end
end
