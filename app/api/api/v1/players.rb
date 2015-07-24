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
        desc "Return an alphabetical list of all players"
        get do
          players = Player.order(name: :asc)
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

        route_param :id do
          desc "Deletes a player"
          delete do
            Player.find(params[:id]).destroy
          end
        end
      end
    end
  end
end
