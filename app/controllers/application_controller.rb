class ApplicationController < ActionController::Base
    def hello
        render plain: "hello cruel world"
    end
end
