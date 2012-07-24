require 'spec_helper'

describe TasksController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end

    it "assigns the tasks into @tasks" do
      task = Task.create!(title: 'bla')
      get 'index'
      assigns(:tasks).should == [task]
    end
  end

  describe "POST 'create'" do
    context "with valid attributes" do
      before :each do
        post 'create', { task: { title: 'my task' } }
      end
      it "creates a new task in the database" do
        Task.find_by_title('my task').should_not be_nil
      end
      it "returns the JSON of the new task" do
        response.body.should == Task.last.to_json
      end
    end

    context "with invalid attributes" do
      before :each do
        post 'create', { task: {} }
      end
      it "returns an error statuscode" do
        response.status.should == 422
      end
      it "returns the errors json" do
        response.body.should == { title: [ "can't be blank" ] }.to_json
      end
    end
  end

end
