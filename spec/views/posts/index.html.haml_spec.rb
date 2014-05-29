require 'spec_helper'

describe "posts/index", :type => :view do
  before(:each) do
    assign(:posts, [
      Post.create!(
        :name => "",
        :body => "MyText",
        :excerpt => "MyText"
      ),
      Post.create!(
        :name => "",
        :body => "MyText",
        :excerpt => "MyText"
      )
    ])
  end

  it "renders a list of posts" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
