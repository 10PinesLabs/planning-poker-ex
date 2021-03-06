defmodule PlanningPoker.Game.GameRepo do
  use Agent

  def create(game) do
    start_link(game)
  end

  @spec find(atom | pid | {atom, any} | {:via, atom, any}) :: any
  def find(id) do
    Agent.get(id, & &1)
  end

  def delete(id) do
    Agent.stop(id)
  end

  def save(id, new_game) do
    Agent.get_and_update(id, fn _game -> {new_game, new_game} end)
  end

  def start_link(game) do
    Agent.start_link(fn -> game end)
  end
end
