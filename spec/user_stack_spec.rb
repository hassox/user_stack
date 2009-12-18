require ::File.expand_path(::File.dirname(__FILE__) + '/spec_helper')

describe "user_stack" do
  describe "GET /" do
    it "should be missing" do
      get "/"
      last_response.should be_not_found
    end

    it "should provide a url for :users" do
      Pancake.url(UserStack,:users).should == "/"
    end
  end

  describe "GET /signup" do
    it "should provide a signup url" do
      get "/signup"
      last_response.should be_successful
    end

    it "should setup a signup route" do
      Pancake.url(UserStack, :signup).should == "/signup"
    end
  end
end
