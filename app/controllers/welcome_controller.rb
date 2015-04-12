class WelcomeController < ApplicationController
  def index
    @quote = Quote.random.first
  end
end