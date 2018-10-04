class HomeController < ApplicationController
  def index
    Rails.logger.info('###')
    Rails.logger.info params.inspect
    Rails.logger.info('###') 
  end

  def about
  end
end
