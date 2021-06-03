class ApplicationController < ActionController::Base

  before_action :set_default_title

  def set_default_title
    @title ||= '-'
  end

end
