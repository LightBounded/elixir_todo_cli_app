
defmodule Todo do
  def start do
    loop([])
  end

  defp loop(list) do
    display_menu()
    case read_input() do
      "1" -> loop(add(list))
      "2" -> loop(list(list))
      "3" -> loop(complete(list))
      "4" -> loop(delete(list))
      "5" -> quit()
      _ -> loop(list)
    end
  end

  defp display_menu do
    IO.puts """
    Todo List App

    1. Add item
    2. List items
    3. Complete item
    4. Delete item
    5. Quit
    """
  end

  defp read_input do
    IO.puts "Enter your choice: "
    IO.gets("") |> String.trim()
  end

  defp add(list) do
    IO.puts "Enter new item: "
    item = IO.gets("") |> String.trim()
    [item | list]
  end

  defp list(list) do
    IO.puts "Todo List:"
    Enum.each(list, fn item -> IO.puts "- #{item}" end)
    list
  end

  defp complete(list) do
    IO.puts "Enter item number to complete: "
    index = IO.gets("") |> String.trim() |> String.to_integer()
    Enum.with_index(list) |> Enum.map(fn {item, i} -> if i == index - 1, do: "[x] #{item}", else: item end)
  end

  defp delete(list) do
    IO.puts "Enter item number to delete: "
    index = IO.gets("") |> String.trim() |> String.to_integer()
    Enum.with_index(list) |> Enum.reject(fn {_, i} -> i == index - 1 end) |> Enum.map(fn {item, _} -> item end)
  end

  defp quit do
    IO.puts "Goodbye!"
    :ok
  end
end

Todo.start()
