# == Schema Information
#
# Table name: projects
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Project < ActiveRecord::Base
  attr_accessible :description, :title

  validates :title, :presence => true, :uniqueness => { :case_sensitive => false }

  has_many :tasks, order: :position

  #default_scope :order => 'projects.updated_at DESC'
  
end
