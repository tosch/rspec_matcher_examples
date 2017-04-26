module CustomMatchers
  class Artefact
    include RSpec::Matchers::Composable

    def matches?(target)
      target.is_a?(::Artefact) && matches_type?(target) && matches_group_number?(target)
    end

    def with_type(expected_type)
      @expected_type = expected_type

      self
    end

    def with_group_number(expected_group_number)
      @expected_group_number = expected_group_number

      self
    end

    def description
      desc = 'be an artefact'
      desc << " with group number #{description_of(@expected_group_number)}" if defined?(@expected_group_number)
      desc << " with type #{description_of(@expected_type)}" if defined?(@expected_type)
      desc
    end

    private

    def matches_type?(target)
      !defined?(@expected_type) || values_match?(@expected_type, target.type)
    end

    def matches_group_number?(target)
      !defined?(@expected_group_number) || values_match?(@expected_group_number, target.group_number)
    end
  end

  def be_an_artefact
    Artefact.new
  end
end

RSpec.configure do |config|
  config.include(CustomMatchers)
end
