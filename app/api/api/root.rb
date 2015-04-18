module API
  class Root < Grape::API
    prefix :api
    format :json
    rescue_from :all
    error_formatter :json, API::ErrorFormatter

    mount API::V1::Root
  end
end
