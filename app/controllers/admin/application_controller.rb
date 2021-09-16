class Admin::ApplicationController < ActionController::Base
  layout 'admin/application'
  before_action :authenticate_admin!
end
