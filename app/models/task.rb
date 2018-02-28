class Task < ApplicationRecord
	require 'date'
	belongs_to :user
	validates :start_date, :title, presence: true
end
