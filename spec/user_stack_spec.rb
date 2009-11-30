require ::File.expand_path(::File.dirname(__FILE__) + '/spec_helper')

describe "user_stack" do
  def app
    user_stack.stackup
  end

  it "fails" do
    fail "hey buddy, you should probably rename this file and start specing for real"
  end
end
