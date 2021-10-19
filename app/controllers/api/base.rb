module Api
    class Base < Grape::API
        #tells your Rails app that another application (usually a rack application and this case our Grape API) exists at that location.
        mount Api::V2::Base
    end
end