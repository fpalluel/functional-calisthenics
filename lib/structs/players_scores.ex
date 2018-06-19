defmodule PlayersScores do
  defstruct p1: 0, p2: 0

  def display_score(%PlayersScores{p1: p1_score, p2: p2_score}) when p1_score == p2_score and p1_score < 3 do
    _display_score(p1_score) <> "-All"
  end

  def display_score(%PlayersScores{p1: p1_score, p2: p2_score}) when p1_score == p2_score and p1_score >= 3 do
   "Deuce"
  end

  def display_score(%PlayersScores{p1: p1_score, p2: p2_score} = score) when abs(p1_score - p2_score) >= 2 and (p1_score >= 4 or p2_score >=4) do
    #ScoresState.stop()
    "Win for #{winning_player(score)}"
  end

  def display_score(%PlayersScores{p1: p1_score, p2: p2_score} = score) when abs(p1_score - p2_score) == 1 and (p1_score >= 4 or p2_score >=4) do
    "Advantage #{winning_player(score)}"
  end

  def display_score(%PlayersScores{p1: p1_score, p2: p2_score}) do
    "#{_display_score(p1_score)}-#{_display_score(p2_score)}"
  end

  def display_score(_), do: "Something ent wrong..."

  defp _display_score(0), do: "Love"
  defp _display_score(1), do: "Fifteen"
  defp _display_score(2), do: "Thirty"
  defp _display_score(3), do: "Forty"

  defp winning_player(%PlayersScores{p1: p1_score, p2: p2_score}) when p2_score > p1_score, do: "player2"
  defp winning_player(%PlayersScores{p1: p1_score, p2: p2_score}) when p2_score < p1_score, do: "player1"
  defp winning_player(_), do: :error

end

