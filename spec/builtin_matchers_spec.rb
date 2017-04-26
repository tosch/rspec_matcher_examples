require 'spec_helper'

RSpec.describe 'Builtin RSpec Matchers' do
  describe 'all matcher' do
    context 'with success' do
      let(:some_array) { ['hello Foo', 'hello Bar'] }

      specify { expect(some_array).to all(a_string_starting_with('hello')) }
    end

    context 'with failure' do
      let(:some_array) { ['good morning, Foo', 'hello Bar'] }

      specify { expect(some_array).to all(a_string_starting_with('hello')) }
    end
  end

  describe 'include matcher' do
    context 'with success' do
      let(:some_array) { ['good morning, Foo', 'hello Bar'] }

      specify { expect(some_array).to include(a_string_starting_with('hello')) }
    end
  end
end
