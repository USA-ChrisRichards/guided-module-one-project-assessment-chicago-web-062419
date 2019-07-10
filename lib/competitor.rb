class Competitor < ActiveRecord::Base
    has_many :fights
    has_many :events, through: :fights

    def full_name
        "#{first_name} #{last_name}"
    end
end