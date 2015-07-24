module API
  module V1
    class Root < Grape::API
      version 'v1'
      mount API::V1::Players
      mount API::V1::Matches
      mount API::V1::Rankings
    end
  end
end
