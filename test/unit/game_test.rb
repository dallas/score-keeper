require 'test_helper'

class GameTest < ActiveSupport::TestCase
  should have_many(:game_plays).dependent(:destroy)

  should allow_mass_assignment_of(:name)
  should allow_mass_assignment_of(:scoring_strategy)
  should_not allow_mass_assignment_of(:id)
  should_not allow_mass_assignment_of(:created_at)
  should_not allow_mass_assignment_of(:updated_at)

  should validate_presence_of(:name)
  should validate_presence_of(:scoring_strategy)

  context 'public instance method' do
    subject { games(:uno) }

    context :as_json do
      setup do
        @json = {
          'id' => Fixtures.identify(:uno),
          'name' => 'UNO',
          'scoring_strategy' => 'low'
        }
      end

      should 'only allow id, name, and scoring_strategy by default' do
        assert_equal @json, subject.as_json
      end

      should 'not allow overwriting the :only option' do
        assert_equal @json, subject.as_json(:only => [:foo, :bar, :baz])
      end

      should 'allow other options to be passed along' do
        json = @json.merge(:scoring_strategy_as_sql_order => 'asc')
        assert_equal json, subject.as_json(:methods => :scoring_strategy_as_sql_order)
      end
    end

    context :scoring_strategy_as_sql_order do
      should 'return "asc" when scoring strategy is "low"' do
        assert_equal 'asc', subject.scoring_strategy_as_sql_order
      end

      should 'return "desc" when scoring strategy is "high"' do
        assert_equal 'desc', games(:canasta).scoring_strategy_as_sql_order
      end
    end
  end
end
