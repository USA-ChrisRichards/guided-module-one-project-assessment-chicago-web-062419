class Event < ActiveRecord::Base
    has_many :fights
    has_many :competitors, through: :fights
end