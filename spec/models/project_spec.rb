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

require 'spec_helper'

describe Project do
  before(:each) do
    @attr = { :title => "example project", :description => "example description bla bla bla" }
  end

  it "should create a new instance given valid attributes" do
    Project.create!(@attr)
  end

  it "should require a title" do
  	no_title_project = Project.new(@attr.merge(:title => ""))
    no_title_project.should_not be_valid
  end

  it "should reject duplicate titles" do
    # Put a user with given email address into the database.
    Project.create!(@attr)
    project_with_duplicate_title = Project.new(@attr)
    project_with_duplicate_title.should_not be_valid
  end

  it "should reject titles identical up to case" do
    upcased_title = @attr[:title].upcase
    Project.create!(@attr.merge(:title => upcased_title))
    project_with_duplicate_title = Project.new(@attr)
    project_with_duplicate_title.should_not be_valid
  end

end
