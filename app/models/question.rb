class Question < ActiveRecord::Base
  validates :option_one, :presence => true
  validates :option_two, :presence => true
end
