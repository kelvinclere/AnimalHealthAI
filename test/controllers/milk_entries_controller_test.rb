require "test_helper"

class MilkEntriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @milk_entry = milk_entries(:one)
  end

  test "should get index" do
    get milk_entries_url
    assert_response :success
  end

  test "should get new" do
    get new_milk_entry_url
    assert_response :success
  end

  test "should create milk_entry" do
    assert_difference("MilkEntry.count") do
      post milk_entries_url, params: { milk_entry: { date: @milk_entry.date, farmer_id: @milk_entry.farmer_id, quantity: @milk_entry.quantity, time: @milk_entry.time } }
    end

    assert_redirected_to milk_entry_url(MilkEntry.last)
  end

  test "should show milk_entry" do
    get milk_entry_url(@milk_entry)
    assert_response :success
  end

  test "should get edit" do
    get edit_milk_entry_url(@milk_entry)
    assert_response :success
  end

  test "should update milk_entry" do
    patch milk_entry_url(@milk_entry), params: { milk_entry: { date: @milk_entry.date, farmer_id: @milk_entry.farmer_id, quantity: @milk_entry.quantity, time: @milk_entry.time } }
    assert_redirected_to milk_entry_url(@milk_entry)
  end

  test "should destroy milk_entry" do
    assert_difference("MilkEntry.count", -1) do
      delete milk_entry_url(@milk_entry)
    end

    assert_redirected_to milk_entries_url
  end
end
