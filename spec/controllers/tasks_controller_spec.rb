require 'spec_helper'

describe TasksController do
  render_views

  before(:each) do
  	  @project = FactoryGirl.create(:project)
      #@task = FactoryGirl.create(:task)
      @attr = { :title => "example task", 
    			:description => "example description bla bla bla", 
    			
    			:status_id => FactoryGirl.create(:status).id,
    			:project_id => @project,
    			:type_id => FactoryGirl.create(:type).id
    		}
      @task=@project.tasks.create(@attr)
    end

  describe "GET 'show'" do

    it "should be successful" do
      get :show, :id => @task
      response.should be_success
    end

    it "should find the right task" do
      get :show, :id => @task
      assigns(:task).should == @task
    end

  end

  describe "POST 'create'" do

    describe "failure" do

      it "should not create a task" do
        lambda do
          post :create, :task => @attr.merge(:title => "") 
        end.should_not change(Task, :count)
      end

      it "should render the 'new' page" do
        post :create, :task => @attr.merge(:title => "") 
        response.should render_template('new')
      end
    end   
      

  end

  describe "GET 'edit'" do

    it "should be successful" do
      get :edit, :id => @task
      response.should be_success
    end

  end

  describe "PUT 'update'" do

    describe "failure" do

      it "should render the 'edit' page" do
        put :update, :id => @task, :task => @attr.merge(:title => "") 
        response.should render_template('edit')
      end

    end

    describe "success" do

      it "should change the task's attributes" do
        put :update, :id => @task, :task => @attr
        @task.reload
        @task.title.should  == @attr[:title]
        @task.description.should == @attr[:description]
        @task.project_id.should_not  == @attr[:project_id]
        @task.type_id.should == @attr[:type_id]
        @task.status_id.should == @attr[:status_id]
      end

      it "should redirect to the task show page" do
        put :update, :id => @task, :task => @attr
        response.should redirect_to(project_path(@task.project))
      end

    end
  end

  describe "DELETE 'destroy'" do

    it "should_redirect_to_index" do
      delete :destroy, :id => @task
      response.should redirect_to(project_url(@task.project))
    end

    it "should delete a task" do
      lambda do
      	delete :destroy, :id => @task
      end.should change(Task, :count)
    end 

  end

end


  