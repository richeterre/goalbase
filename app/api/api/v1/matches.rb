module API
  module V1
    module Entities
      class Match < Grape::Entity
        expose :home_goals
        expose :away_goals
      end
    end

    class Matches < Grape::API
      resource :matches do
        desc "Return a list of all matches"
        get do
          matches = Match.all
          present matches, with: Entities::Match
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
