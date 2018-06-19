defmodule ScoresState do
  use Agent

  @moduledoc """
  This only stores the players scores in a process
  """

  def init_and_get do
    Agent.start_link(fn -> %PlayersScores{} end, name: __MODULE__)
    get()
  end

  def stop do
    Agent.stop(__MODULE__)
  end

  def get do
    Agent.get(__MODULE__, fn scores -> scores end)
  end

  def inc_player_score(:p1) do
    Agent.update(__MODULE__, fn old_score -> %PlayersScores{old_score | p1: old_score.p1 + 1 } end)
  end
  def inc_player_score(:p2) do
    Agent.update(__MODULE__, fn old_score -> %PlayersScores{old_score | p2: old_score.p2 + 1 } end)
  end
  def inc_player_score(_), do: "Can only be :p1 or :p2"

end
