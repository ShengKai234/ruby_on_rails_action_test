module Api
    class Test < Grape::API
        get :ping do
            { data: "pong" }
        end
    end
end