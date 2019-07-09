class Competitor < ActiveRecord::Base
    has_many :fights
    has_many :events, through: :fights
end