class GameSerializer < ActiveModel::Serializer
  attributes :game_id, :scores

  def game_id
    object.id
  end

  def scores
    [
      {
        "user_id": object.player_1.id,
        "score": 5
      },
      {
        "user_id": object.player_2.id,
        "score": 10
      }
    ]
  end



end
