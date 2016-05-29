require 'test_helper'

class SubstitutionTest < ActiveSupport::TestCase
  setup do
    @substitution = substitutions(:substitution)
  end

  test 'valid' do
    assert @substitution.valid?
  end
end
