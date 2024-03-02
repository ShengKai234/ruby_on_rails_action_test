class PagesController < ApplicationController
    def hello
        render plain: params
    end
end