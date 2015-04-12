module API
  module V1
    class Players < Grape::API
      resource :players do
        desc "Return a list of all players"
        get do
          Player.all
        end

        desc "Create a new player"
        params do
          requires :name, type: String, desc: "The player's name"
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
