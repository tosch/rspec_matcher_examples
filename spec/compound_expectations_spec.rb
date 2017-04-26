require 'spec_helper'

RSpec.describe 'Compound Expectations' do
  SomeBase = Class.new

  class SomeModel < SomeBase
    attr_reader :foo
    attr_accessor :context

    COLORS = %w[red green blue].freeze

    def initialize(context = 0)
      @foo = 'bar'
      @context = context
    end

    def color
      COLORS[context % 3]
    end
  end

  describe SomeModel do
    let(:instance) { described_class.new(context) }
    let(:context) { 0 }

    it { is_expected.to be_a(SomeBase).and have_attributes(foo: 'bar') }

    shared_examples_for 'any context of model' do
      describe '#color' do
        subject { instance.color }

        it { is_expected.to eql('green').
          or eql('blue').
            or eql('red') }
      end
    end

    context 'when context is 0' do
      it_behaves_like 'any context of model'
    end

    context 'when context is 10' do
      let(:context) { 10 }

      it_behaves_like 'any context of model'
    end

    context 'when context is 20' do
      let(:context) { 20 }

      it_behaves_like 'any context of model'
    end
  end
end
