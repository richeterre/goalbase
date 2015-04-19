module API
  module V1
    module Entities
      class Player < Grape::Entity
        expose :id
        expose :name
      end
    end

    class Players < Grape::API
      resource :players do
        desc "Return a list of all players"
        get do
          players = Player.all
          present players, with: Entities::Player
        end

        desc "Create a new player"
        params do
          requires :name, type: String, allow_blank: false, desc: "The player's name"
        end
        post do
          Player.create!({
            name: params[:name]
          })
        end
      end
    end
  end
end
