
class User < ApplicationRecord
	include BCrypt
	include ApplicationHelper
	require 'date'
	has_secure_password
	has_many :categories
	has_many :tasks , dependent: :destroy
	
	
end
