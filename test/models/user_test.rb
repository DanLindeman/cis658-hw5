require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.create(fname: "Joe", lname: "Coolguy", email: "joe@yahoo.com", thumbnail: "thing.gif")
  end

  # lname, fname, email cannot be blank whenever an author is created or edited.
  # email must be unique and be a valid format for an email address. 
  # thumbnail must end with either .png, .jpg, or .gif.  It is ok to leave the thumbnail field blank. 
  

  test "First name cannot be blank" do
    @user.fname = ""
    assert_not @user.valid?
  end

  test "Last name cannot be blank" do
    @user.lname = ""
    assert_not @user.valid?
  end

  test "Email cannot be blank" do
    @user.email = ""
    assert_not @user.valid?
  end

  test "Email must have valid values" do
    invalid_emails = ["bob", "123412341234"]
    invalid_emails.each do |email|
        begin
            @user.email = email
            assert false, "#{email} should be invalid"
        rescue => exception
            assert true
        end
    end
  end



  # test "Email must be unique" do
  #   invalid_emails = ["tom@example.com", "tom@example.com"]
  #   bug1 = User.create(fname: "Tom", lname: "Coolguy", email: "tom@example.com", thumbnail: "thing.gif")
  #   bug1 = User.create(fname: "Tom", lname: "OtherGuy", email: "tom@example.com", thumbnail: "thing.gif")
  #   invalid_emails.each do |email|
  #       begin
            
  #           assert false, "#{email} should be invalid"
  #       rescue => exception
  #           assert true              
  #       end
  #   end
  # end

  test "thumbnails must have valid values" do
    invalid_thumbnails = ["abc.mov", "123412341234"]
    invalid_thumbnails.each do |thumbnail|
        begin
            @user.thumbnail = thumbnail
            assert false, "#{thumbnail} should be invalid"
        rescue => exception
            assert true
        end
    end
  end
end
