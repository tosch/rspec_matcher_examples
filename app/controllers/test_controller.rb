class TestController < ApplicationController
  before_filter :authenticate

  delegate :current_user, to: :auth_state

  private

  def authenticate
  end

  def auth_state
    @auth_state ||= Struct.new(:current_user).new
  end
end
