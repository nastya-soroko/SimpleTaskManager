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

require 'spec_helper'

describe Task do

  before(:each) do
  	@project = FactoryGirl.create(:project)
    @attr = { 	:title => "example task", 
    			:description => "example description bla bla bla", 
    			:project_id => @project.id,
    			:status_id => FactoryGirl.create(:status).id,
    			:type_id => FactoryGirl.create(:type).id
    		}
  end

  describe "project associations" do

    before(:each) do
      @task = @project.tasks.create({ 	:title => "example task", 
    									:description => "example description bla bla bla", 
					    				:status_id => FactoryGirl.create(:status).id,
					    				:type_id => FactoryGirl.create(:type).id
    								})
    end

    it "should have a user attribute" do
      @task.should respond_to(:project)
    end

    it "should have the right associated user" do
      @task.project_id.should == @project.id
      @task.project.should == @project
    end
  end

  describe "validations" do  

	  it "should create a new instance given valid attributes" do
	    Task.create!(@attr)
	  end

	  it "should require a title" do
	  	no_title = Task.new(@attr.merge(:title => ""))
	    no_title.should_not be_valid
	  end

	  it "should require a description" do
	  	no_desc = Task.new(@attr.merge(:description => ""))
	    no_desc.should_not be_valid
	  end

	  it "should require a project" do
	  	no_project = Task.new(@attr.merge(:project_id => nil))
	    no_project.should_not be_valid
	  end

	  it "should require a type" do
	  	no_type = Task.new(@attr.merge(:type_id => nil))
	    no_type.should_not be_valid
	  end

	  it "should require a status" do
	  	no_status = Task.new(@attr.merge(:status_id => nil))
	    no_status.should_not be_valid
	  end
  end	  
end
