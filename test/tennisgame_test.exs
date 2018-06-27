defmodule TennisGameTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest TennisGame

  @allScores [
    [0, 0, :player_scored, "Love-All"],
    [1, 1, :player_scored, "Fifteen-All"],
    [2, 2, :player_scored, "Thirty-All"],
    [3, 3, :player_scored, "Deuce"],
    [4, 4, :player_scored, "Deuce"],

    [1, 0, :player_scored, "Fifteen-Love"],
    [0, 1, :player_scored, "Love-Fifteen"],
    [2, 0, :player_scored, "Thirty-Love"],
    [0, 2, :player_scored, "Love-Thirty"],
    [3, 0, :player_scored, "Forty-Love"],
    [0, 3, :player_scored, "Love-Forty"],
    [4, 0, :player_won, "Win for player1"],
    [0, 4, :player_won, "Win for player2"],

    [2, 1, :player_scored, "Thirty-Fifteen"],
    [1, 2, :player_scored, "Fifteen-Thirty"],
    [3, 1, :player_scored, "Forty-Fifteen"],
    [1, 3, :player_scored, "Fifteen-Forty"],
    [4, 1, :player_won, "Win for player1"],
    [1, 4, :player_won, "Win for player2"],

    [3, 2, :player_scored, "Forty-Thirty"],
    [2, 3, :player_scored, "Thirty-Forty"],
    [4, 2, :player_won, "Win for player1"],
    [2, 4, :player_won, "Win for player2"],

    [4, 3, :player_scored, "Advantage player1"],
    [3, 4, :player_scored, "Advantage player2"],
    [5, 4, :player_scored, "Advantage player1"],
    [4, 5, :player_scored, "Advantage player2"],
    [15, 14, :player_scored, "Advantage player1"],
    [15, 15, :player_scored, "Deuce"],
    [14, 15, :player_scored, "Advantage player2"],

    [6, 4, :player_won, "Win for player1"],
    [4, 6, :player_won, "Win for player2"],
    [16, 14, :player_won, "Win for player1"],
    [14, 16, :player_won, "Win for player2"]
  ]

  test "it display right scores" do
    @allScores
    |> Enum.each(fn state ->
      assert capture_io(fn ->
        %GameState{
          status: Enum.at(state, 2),
          scores: %PlayersScores{p1: Enum.at(state, 0), p2: Enum.at(state, 1)}
        }
        |> ScoresFormatter.display_score
      end) == Enum.at(state, 3) <> "\n"

      state
      |> IO.inspect(label: "Test OK")
    end)

  end
end
