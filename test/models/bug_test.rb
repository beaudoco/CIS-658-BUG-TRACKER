require 'test_helper'

class BugTest < ActiveSupport::TestCase

  def setup
    @bug = Bug.create(title:"a title", description:"this is a long description",
      issue_type:2, priority:1, status:0)
  end
  
  test "bug must be valid" do
    assert @bug.valid?
  end
  
  test "title must be present" do
    @bug.title = ""
    assert_not @bug.valid?
  end
  
  test "title must be between 5 and 80 characters" do
    @bug.title = "aa"
    assert_not @bug.valid?
  end

  test "title must be shorter than 80 characters" do
    @bug.title = "a" * 81
    assert_not @bug.valid?
  end

  test "description must be present" do
    @bug.description = ""
    assert_not @bug.valid?
  end

  test "description must be between 20 and 600 characters" do
    @bug.description = "aa"
    assert_not @bug.valid?
  end

  test "description must be shorter than 600 characters" do
    @bug.description = "a" * 601;
    assert_not @bug.valid?
  end

  test "issuetype must be valid" do
    invalid_issuetypes = [-10,-1,5,10]
    invalid_issuetypes.each do |is|
      begin
        @bug.issue_type is
        assert false, "#{is} should be invalid"
      rescue
        assert true
      end
    end
  end
    
  test "issuetype must be one of our 3" do
      valid_issuetypes = [:issue, :enhancement, :feature]
      valid_issuetypes.each do |vs|
        begin
          @bug.issue_type vs
          assert true
        rescue
          assert false, "#{vs} should be valid"
        end
      end
  end
    
  test "priority must be valid" do
    invalid_priority = [-10,-1,5,10]
    invalid_priority.each do |is|
      begin
        @bug.issue_type is
        assert false, "#{is} should be invalid"
      rescue
        assert true
      end
    end
  end

  test "priority must be one of our 3" do
    valid_priority = [:low, :medium, :high]
    valid_priority.each do |vs|
      begin
        @bug.issue_type vs
        assert true
      rescue
        assert false, "#{vs} should be valid"
      end
    end
  end
    
  test "status must be valid" do
    invalid_status = [-10,-1,5,10]
    invalid_status.each do |is|
      begin
        @bug.issue_type is
        assert false, "#{is} should be invalid"
      rescue
        assert true
      end
    end
  end

  test "status must be one of our 3" do
    valid_status = [:open, :closed, :monitor]
    valid_status.each do |vs|
      begin
        @bug.issue_type vs
        assert true
      rescue
        assert false, "#{vs} should be valid"
      end
    end
  end

end
