module API
  class Root < Grape::API
    prefix :api
    format :json
    mount API::V1::Root
  end
end
