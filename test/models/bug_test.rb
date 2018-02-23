require 'test_helper'

class BugTest < ActiveSupport::TestCase

# Title and description cannot be blank whenever a bug is created or edited.
# Issue_type, priority and status must have valid values (you should represent these values as enumerated types.) 
# The default value of issue_type should be feature. 
# The default value of priority should be medium.
# The default value of status should be open.

    def setup
        @bug = bugs(:one)
        @user = users(:one)
    end

    test "Title cannot be blank" do
        @bug.title = ""
        assert_not @bug.valid?
    end

    test "Description cannot be blank" do
        @bug.description = ""
        assert_not @bug.valid?
    end

    test "Issue type must have valid values" do
        invalid_types = [-1, 4, 1000]
        invalid_types.each do |it|
            begin
                @bug.issue_type = it
                assert false, "#{it} should be invalid"
            rescue => exception
                assert true              
            end
        end
    end

    test "Priority must have valid values" do
        invalid_priorities = [-1, 4, 1000]
        invalid_priorities.each do |ip|
            begin
                @bug.priority = ip
                assert false, "#{ip} should be invalid"
            rescue => exception
                assert true              
            end
        end
    end

    test "Status must have valid values" do
        invalid_statuses = [-1, 4, 1000]
        invalid_statuses.each do |is|
            begin
                @bug.status = is
                assert false, "#{is} should be invalid"
            rescue => exception
                assert true              
            end
        end
    end

    test "default value of issue_type should be issue" do
        assert_equal("issue", @bug.issue_type)
    end

    test "default value of priority should be medium" do
        assert_equal("medium", @bug.priority)
    end

    test "default value of status should be open" do
        assert_equal("open", @bug.status)
    end
    
end
