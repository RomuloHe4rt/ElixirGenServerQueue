defmodule ElixirGenServer.Queue do
  use GenServer

  # CLIENT

  def start_link(queue) do
    GenServer.start_link(__MODULE__, queue)
  end

  def enqueue(pid, element) do
    GenServer.cast(pid, {:enqueue, element})
  end

  def dequeue(pid) do
    GenServer.call(pid, :dequeue)
  end

  # SERVER

  @impl true
  def init(state), do: {:ok, state}

  @impl true
  def handle_call(:dequeue, _from, [head | tail]) do
    {:reply, head, tail}
  end

  @impl true
  def handle_call(:dequeue, _from, []) do
    {:reply, nil, []}
  end

  @impl true
  def handle_cast({:enqueue, element}, state) do
    {:noreply, state ++ [element]}
  end
end
