class Admin::DashboardController < ApplicationController
  include HttpAuthConcern

  http_basic_authenticate_with name: ENV['ADMIN_USERNAME'], password: ENV['ADMIN_PASSWORD'], except: [:index]
  def show
  end
end
