class Admin::AdminApplicationController < ActionController::Base
  layout 'admin/admin_application'
  before_action :authenticate_admin!
end
