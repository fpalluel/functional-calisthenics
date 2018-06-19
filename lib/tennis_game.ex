defmodule TennisGame do
  def start do
    ScoresState.init_and_get
      |> PlayersScores.display_score
  end

  def score(player_id) when player_id in [:p1, :p2] do
      ScoresState.inc_player_score(player_id)
      ScoresState.get
      |> PlayersScores.display_score
  end
  def score(_), do: "Can only be :p1 or :p2"

end
