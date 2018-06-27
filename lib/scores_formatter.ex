defmodule ScoresFormatter do

  def display_score(%GameState{status: :player_won, scores: scores} = previous_state) do
    IO.puts "Win for #{winning_player(scores)}"
    previous_state
  end

  def display_score(%GameState{scores: %PlayersScores{} = scores} = previous_state) do
    display_score(scores)
    previous_state
  end

  def display_score(%PlayersScores{p1: p1_score, p2: p2_score}) when p1_score == p2_score and p1_score < 3 do
    IO.puts _display_score(p1_score) <> "-All"
  end

  def display_score(%PlayersScores{p1: p1_score, p2: p2_score}) when p1_score == p2_score and p1_score >= 3 do
   IO.puts "Deuce"
  end

  def display_score(%PlayersScores{p1: p1_score, p2: p2_score} = score) when abs(p1_score - p2_score) == 1 and (p1_score >= 4 or p2_score >=4) do
    IO.puts "Advantage #{winning_player(score)}"
  end

  def display_score(%PlayersScores{p1: p1_score, p2: p2_score}) do
    IO.puts "#{_display_score(p1_score)}-#{_display_score(p2_score)}"
  end

  def display_score(_), do: IO.puts "Should be a PlayersScores struct"

  defp _display_score(0), do: "Love"
  defp _display_score(1), do: "Fifteen"
  defp _display_score(2), do: "Thirty"
  defp _display_score(3), do: "Forty"
  defp _display_score(_), do: "Not existing"

  defp winning_player(%PlayersScores{p1: p1_score, p2: p2_score}) when p2_score > p1_score, do: "player2"
  defp winning_player(%PlayersScores{p1: p1_score, p2: p2_score}) when p2_score < p1_score, do: "player1"
  defp winning_player(_), do: "none"
end
