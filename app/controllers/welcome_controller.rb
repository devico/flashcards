class WelcomeController < ApplicationController
  def index
  end

  def review
    @card = Card.order("RANDOM()").first
  end

  def check

  end

end
