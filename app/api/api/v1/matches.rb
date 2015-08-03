module API
  module V1
    module Entities
      class Match < Grape::Entity
        expose :id
        expose :home_goals
        expose :away_goals
        expose :home_players, using: Entities::Player
        expose :away_players, using: Entities::Player
      end
    end

    class Matches < Grape::API
      resource :matches do
        desc "Return a list of all matches in descending order of creation (newest first)"
        get do
          matches = Match.order(created_at: :desc)
          present matches, with: Entities::Match
        end

        desc "Create a new match"
        params do
          requires :home_goals, type: Integer, desc: "Goals scored by home players"
          requires :away_goals, type: Integer, desc: "Goals scored by away players"
          requires :home_player_ids, type: Array[String], desc: "IDs of home players in the match"
          requires :away_player_ids, type: Array[String], desc: "IDs of away players in the match"
        end
        post do
          home_players = Player.find(params[:home_player_ids])
          away_players = Player.find(params[:away_player_ids])
          Match.create!({
            home_goals: params[:home_goals],
            away_goals: params[:away_goals],
            home_players: home_players,
            away_players: away_players
          })
        end

        route_param :id do
          desc "Updates a match"
          params do
            requires :home_goals, type: Integer, desc: "Goals scored by home players"
            requires :away_goals, type: Integer, desc: "Goals scored by away players"
            requires :home_player_ids, type: Array[String], desc: "IDs of home players in the match"
            requires :away_player_ids, type: Array[String], desc: "IDs of away players in the match"
          end
          put do
            home_players = Player.find(params[:home_player_ids])
            away_players = Player.find(params[:away_player_ids])
            match = Match.find(params[:id])
            match.update!({
              home_goals: params[:home_goals],
              away_goals: params[:away_goals],
              home_players: home_players,
              away_players: away_players
            })
            return match
          end

          desc "Deletes a match"
          delete do
            Match.find(params[:id]).destroy
          end
        end
      end
    end
  end
end
