# == Schema Information
#
# Table name: tasks
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  project_id  :integer
#  sequence    :integer
#

class Task < ActiveRecord::Base
  attr_accessible :description, :title, :project_id

  validates :title, :presence => true, :length => { :maximum => 30 }
  validates :description, :presence => true, :length => { :maximum => 500 }
  validates :project_id, :presence => true
  #validates :sequence, :presence => true

  #default_scope :order => 'tasks.sequence DESC'

  belongs_to :project
end
