module API
  module V1
    class Matches < Grape::API
      resource :matches do
        desc "Return a list of all matches"
        get do
          Match.all
        end

        desc "Create a new match"
        params do
          requires :home_goals, type: Integer
          requires :away_goals, type: Integer
        end
        post do
          Match.create!({
            home_goals: params[:home_goals],
            away_goals: params[:away_goals]
          })
        end
      end
    end
  end
end
