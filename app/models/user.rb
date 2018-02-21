class User < ApplicationRecord
  has_many :plays

  def total_score
    plays.sum(:score)
  end
end
