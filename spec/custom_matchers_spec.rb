require 'spec_helper'

class Artefact
  attr_accessor :type, :group_number

  def initialize(type: 'Base', group_number: 0)
    self.type = type
    self.group_number = group_number
  end
end

RSpec.describe 'Custom RSpec matchers' do
  subject { Artefact.new(type: type, group_number: group_number) }

  let(:type) { 'Foo' }
  let(:group_number) { 1 }

  describe 'with matcher DSL' do
    RSpec::Matchers.define :be_an_artefact_dsl_matcher do
      chain :with_type do |expected_type|
        @expected_type = expected_type
      end

      chain :with_group_number do |expected_group_number|
        @expected_group_number = expected_group_number
      end

      match do |actual|
        actual.is_a?(Artefact) &&
          (!@expected_type || values_match?(@expected_type, actual.type)) &&
          (!@expected_group_number ||
            values_match?(@expected_group_number, actual.group_number))
      end
    end

    it { is_expected.to be_an_artefact_dsl_matcher.with_type('Foo').with_group_number(1) }
  end

  describe 'with matcher from scratch' do
    it { is_expected.to be_an_artefact.with_type('Foo').with_group_number(1) }

    it { is_expected.to_not be_an_artefact.with_type('PurchaseInvoice') }
  end
end
