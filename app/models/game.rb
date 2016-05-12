class Game < ActiveRecord::Base
	validates :score, :accuracy, presence: true
	belongs_to :user
end
