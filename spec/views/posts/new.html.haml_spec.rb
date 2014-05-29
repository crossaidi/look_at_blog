require 'spec_helper'

describe "posts/new", :type => :view do
  before(:each) do
    assign(:post, Post.new(
      :name => "",
      :body => "MyText",
      :excerpt => "MyText"
    ))
  end

  it "renders new post form" do
    render

    assert_select "form[action=?][method=?]", posts_path, "post" do

      assert_select "input#post_name[name=?]", "post[name]"

      assert_select "textarea#post_body[name=?]", "post[body]"

      assert_select "textarea#post_excerpt[name=?]", "post[excerpt]"
    end
  end
end
