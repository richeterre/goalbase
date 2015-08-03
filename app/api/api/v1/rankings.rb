module API
  module V1
    module Entities
      class Ranking < Grape::Entity
        expose :player, using: Entities::Player
        expose :rating
      end
    end

    class Rankings < Grape::API
      resource :rankings do
        desc "Returns an list of player rankings in descending rating order"
        get do
          rankings = Player.all.map { |player|
            {
              player: player,
              rating: player.rating
            }
          }.sort_by { |ranking| ranking[:rating] }.reverse
          present rankings, with: Entities::Ranking
        end
      end
    end
  end
end
