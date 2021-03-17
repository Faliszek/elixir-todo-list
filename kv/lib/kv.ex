defmodule KV.Bucket do
  use Agent

  @moduledoc """
  Documentation for `KV`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> KV.hello()
      :world

  """
  def start_link(_opts) do
    Agent.start_link(fn -> %{} end)
  end

  def get(bucket, key) do
    Agent.get(bucket, fn v -> Map.get(v, key) end)
  end

  def put(bucket, key, value) do
    Agent.update(bucket, fn bucket -> Map.put(bucket, key, value) end)
  end

  def delete(bucket, key) do
    Agent.get_and_update(bucket, fn dict -> Map.pop(dict, key) end)
  end
end

defmodule KV do
  def hello do
    :world
  end
end
