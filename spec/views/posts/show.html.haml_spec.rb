require 'spec_helper'

describe "posts/show", :type => :view do
  before(:each) do
    @post = assign(:post, Post.create!(
      :name => "",
      :body => "MyText",
      :excerpt => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
  end
end
