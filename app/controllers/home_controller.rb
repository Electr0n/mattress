class HomeController < ApplicationController
  def index
    @best_selled = Mattress.best_selled
  end
end
