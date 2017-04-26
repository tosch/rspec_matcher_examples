require 'rails_helper'

RSpec.describe TestController, type: :controller do
  it { is_expected.to use_before_filter :authenticate }

  it { is_expected.to delegate_method(:current_user).to(:auth_state) }
end
