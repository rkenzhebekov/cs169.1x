class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_result(m1, m2)
  player1_strategy = m1.last
  player2_strategy = m2.last

  return m1 if player1_strategy == player2_strategy

  case(player1_strategy + player2_strategy)
    when /(RS|SR)/i
      player1_strategy == 'R' ? m1 : m2
    when /(PS|SP)/i
      player1_strategy == 'S' ? m1 : m2
    else
      player1_strategy == 'P' ? m1 : m2
  end
end

def rps_game_winner(game)
  strategy = %r{(R|S|P)}i

  raise WrongNumberOfPlayersError unless game.count == 2

  player1_strategy = game[0][1]
  player2_strategy = game[1][1]

  raise NoSuchStrategyError unless player1_strategy =~ strategy and player2_strategy =~ strategy

  rps_result game.first, game.last
end

def rps_tournament_winner(tournament)
  return tournament.first if tournament.size == 1
  return rps_game_winner(tournament) if tournament.size == 2 and tournament.flatten.size == 4

  first_half = rps_tournament_winner tournament[0]
  second_half = rps_tournament_winner tournament[1]

  rps_game_winner [first_half, second_half]
end

tournament = [
    [
        [ ["Armando", "P"], ["Dave", "S"] ],
        [ ["Richard", "R"],  ["Michael", "S"] ],
    ],
    [
        [ ["Allen", "S"], ["Omer", "P"] ],
        [ ["David E.", "R"], ["Richard X.", "P"] ]
    ]
]

#p rps_tournament_winner tournament
