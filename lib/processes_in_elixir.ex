defmodule ProcessesInElixir do
  def loop do
    receive do
      {:add, num1, num2, requester} ->
        send requester, {:total, num1 + num2}
      {:reverse, value, requester} ->
        send requester, {:result, String.reverse(value)}
    end

    loop
  end
end
