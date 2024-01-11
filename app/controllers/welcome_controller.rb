class WelcomeController < ApplicationController
  def index
    cookies[:curso] = "Curso Ruby on Rails 5x - JacksoPires (Cookie)"
    #session[:curso] = "Curso Ruby on Rails 5x - JacksoPires (Cookie)"
  end
end
