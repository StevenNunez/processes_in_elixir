defmodule ProcessesInElixirTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  test "handles {:add, num1, num2, requester} properly" do
    pid = spawn(ProcessesInElixir, :loop, [])

    send pid, {:add, 1, 2, self}
    assert_receive {:total, 3}
  end

  test "process can be sent multiple messages" do
    pid = spawn(ProcessesInElixir, :loop, [])

    send pid, {:add, 1, 2, self}
    assert_receive {:total, 3}

    send pid, {:add, 4, 8, self}
    assert_receive {:total, 12}
  end

  test "handles {:reverse, \"Steven\", requester} properly" do
    pid = spawn(ProcessesInElixir, :loop, [])

    send pid, {:reverse, "Steven", self}
    assert_receive {:result, "nevetS"}
  end
end
