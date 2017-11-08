require "./spec_helper"

def create_subject
  subject = Post.new
  subject.name = "test"
  subject.save
  subject
end

describe PostController do
  Spec.before_each do
    Post.clear
  end

  describe "index" do
    it "renders all the posts" do
      subject = create_subject
      get "/posts"
      response.body.should contain "test"
    end
  end

  describe "show" do
    it "renders a single post" do
      subject = create_subject
      get "/posts/#{subject.id}"
      response.body.should contain "test"
    end
  end

  describe "new" do
    it "render new template" do
      get "/posts/new"
      response.body.should contain "New Post"
    end
  end

  describe "create" do
    it "creates a post" do
      post "/posts", body: "name=testing"
      subject_list = Post.all
      subject_list.size.should eq 1
    end
  end

  describe "edit" do
    it "renders edit template" do
      subject = create_subject
      get "/posts/#{subject.id}/edit"
      response.body.should contain "Edit Post"
    end
  end

  describe "update" do
    it "updates a post" do
      subject = create_subject
      patch "/posts/#{subject.id}", body: "name=test2"
      result = Post.find(subject.id).not_nil!
      result.name.should eq "test2"
    end
  end

  describe "delete" do
    it "deletes a post" do
      subject = create_subject
      delete "/posts/#{subject.id}"
      result = Post.find subject.id
      result.should eq nil
    end
  end
end
