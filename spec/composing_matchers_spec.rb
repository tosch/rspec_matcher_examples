require 'spec_helper'

RSpec.describe 'Composing Matchers' do
  class SomeObject
    attr_reader :amount

    def initialize(amount)
      @amount = amount
    end

    def *(factor)
      @amount *= factor
    end
  end

  describe SomeObject do
    let(:instance) { SomeObject.new(1.0) }

    describe '#*' do
      subject { instance * 5.0 }

      specify { expect { subject }.to change(instance, :amount).by(4.0) } # ) a_value_within(0.1).of(4.0)) }
    end
  end
end
