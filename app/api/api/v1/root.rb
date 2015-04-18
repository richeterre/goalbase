module API
  module V1
    class Root < Grape::API
      version 'v1'
      mount API::V1::Players
      mount API::V1::Matches
    end
  end
end
