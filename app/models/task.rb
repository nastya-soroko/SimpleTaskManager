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
#  type_id     :integer
#  status_id   :integer
#

class Task < ActiveRecord::Base
  attr_accessible :description, :title, :project_id, :status_id, :type_id

  validates :title, :presence => true, :length => { :maximum => 30 }
  validates :description, :presence => true, :length => { :maximum => 500 }
  validates :project_id, :presence => true
  validates :status_id, :presence => true
  validates :type_id, :presence => true
  

  #default_scope :order => 'tasks.updated_at DESC'

  belongs_to :project
  belongs_to :status
  belongs_to :type

  acts_as_list scope: :project
end
