require 'spec_helper'

describe ProjectsController do
  render_views

  describe "GET 'show'" do

    before(:each) do
      @project = Factory.create(:project)
    end

    it "should be successful" do
      get :show, :id => @project
      response.should be_success
    end

    it "should find the right project" do
      get :show, :id => @project
      assigns(:project).should == @project
    end

  end

  describe "POST 'create'" do

    describe "failure" do
      before(:each) do
        @attr = { :title => "", :description => "" }
      end

      it "should not create a project" do
        lambda do
          post :create, :project => @attr
        end.should_not change(Project, :count)
      end

      it "should render the 'new' page" do
        post :create, :project => @attr
        response.should render_template('new')
      end
    end   
      

  end

  describe "GET 'edit'" do

    before(:each) do
      @project = FactoryGirl.create(:project)
     end

    it "should be successful" do
      get :edit, :id => @project
      response.should be_success
    end

  end

  describe "PUT 'update'" do

    before(:each) do
      @project = FactoryGirl.create(:project)
    end

    describe "failure" do

      before(:each) do
        @attr = { :title => "", :description => "" }
      end

      it "should render the 'edit' page" do
        put :update, :id => @project, :project => @attr
        response.should render_template('edit')
      end

    end

    describe "success" do

      before(:each) do
        @attr = { :title => "title", :description => "desc" }
      end

      it "should change the project's attributes" do
        put :update, :id => @project, :project => @attr
        @project.reload
        @project.title.should  == @attr[:title]
        @project.description.should == @attr[:description]
      end

      it "should redirect to the project show page" do
        put :update, :id => @project, :project => @attr
        response.should redirect_to(project_path(@project))
      end

    end
  end

  describe "GET 'index'" do

    it "should be successful" do
      get :index
      response.should be_success
    end
    
  end



  describe "DELETE 'destroy'" do

    before(:each) do
      @project = FactoryGirl.create(:project)
    end

    it "should_redirect_to_index" do
      delete :destroy, :id => @project
      response.should redirect_to(projects_url)
    end

    it "should delete a project" do
      lambda do
      	delete :destroy, :id => @project
      end.should change(Project, :count)
    end 

  end

end


  