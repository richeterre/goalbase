module API
  module V1
    class Players < Grape::API
      resource :players do
        desc "Return list of all players"
        get do
          Player.all
        end
      end
    end
  end
end
