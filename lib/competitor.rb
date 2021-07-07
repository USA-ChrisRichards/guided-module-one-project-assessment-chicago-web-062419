class Competitor < ActiveRecord::Base
    has_many :fights
    has_many :events, through: :fights

    def full_name
        "#{first_name} #{last_name}"
    end

    # def list_roles
    #     self.fights.collect do |fight|
    #       "#{fight.competitor_id} - #{fight.event.city}"
    #     end
    #   end
end