class Question < ActiveRecord::Base
  validates :option_one, :presence => true
  validates :option_two, :presence => true
  acts_as_votable
  has_attached_file :image_one, :styles => { :medium => "300x300>", :thumb => "100x100#" }
  has_attached_file :image_two, :styles => { :medium => "300x300>", :thumb => "100x100#" }
  validates_attachment_content_type :image_one, :content_type => /\Aimage\/.*\Z/
  validates_attachment_content_type :image_two, :content_type => /\Aimage\/.*\Z/
end
