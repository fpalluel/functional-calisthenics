defmodule TennisGame do

  def play(), do: play(%GameState{})
  def play(%GameState{status: :waiting_key, scores: previous_scores}) do
      case IO.gets("Enter scoring player (1 or 2): \n") do
        "1\n" -> play(%GameState{status: :player_scored, scores: %PlayersScores{previous_scores | p1: previous_scores.p1 + 1 } })
        "2\n" -> play(%GameState{status: :player_scored, scores: %PlayersScores{previous_scores | p2: previous_scores.p2 + 1 } })
        _ ->
          IO.puts "Should be '1' or '2'"
          play(%GameState{status: :waiting_key, scores: previous_scores})
      end
  end

  def play(%GameState{status: :player_scored} = game_state  ) do
    game_state
    |> is_there_a_winner?
    |> ScoresFormatter.display_score
    |> play
  end

  def play(%GameState{status: :player_won}), do: IO.puts "End of the game !"
  def play(_), do: IO.puts "Something got wrong !"


  @doc """
    Checks if a player won, and change the game state status accordingly

    ## Examples

        iex> TennisGame.is_there_a_winner?(%GameState{status: :player_scored, scores: %PlayersScores{p1: 0, p2: 4}})
        %GameState{status: :player_won, scores: %PlayersScores{p1: 0, p2: 4}}

        iex> TennisGame.is_there_a_winner?(%GameState{status: :player_scored, scores: %PlayersScores{p1: 16, p2: 14}})
        %GameState{status: :player_won, scores: %PlayersScores{p1: 16, p2: 14}}

        iex> TennisGame.is_there_a_winner?(%GameState{status: :player_scored, scores: %PlayersScores{p1: 1, p2: 2}})
        %GameState{status: :waiting_key, scores: %PlayersScores{p1: 1, p2: 2}}

  """
  def is_there_a_winner?(%GameState{scores: %PlayersScores{p1: p1_score, p2: p2_score}} = previous_game_state)
    when abs(p1_score - p2_score) >= 2 and (p1_score >= 4 or p2_score >=4) do
    %GameState{previous_game_state | status: :player_won}
  end
  def is_there_a_winner?(%GameState{} = previous_state), do: %GameState{previous_state | status: :waiting_key}
  def is_there_a_winner?(_), do: IO.puts "Winner check needs a GameState struct"

end
