require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Book do
  before(:each) do
    @valid_attributes = {
      :title => "value for title",
      :isbn => "value for isbn",
      :description => "value for description"
    }
  end

  it "should create a new instance given valid attributes" do
    Book.create!(@valid_attributes)
  end
end
