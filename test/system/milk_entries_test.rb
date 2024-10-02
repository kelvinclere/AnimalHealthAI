require "application_system_test_case"

class MilkEntriesTest < ApplicationSystemTestCase
  setup do
    @milk_entry = milk_entries(:one)
  end

  test "visiting the index" do
    visit milk_entries_url
    assert_selector "h1", text: "Milk entries"
  end

  test "should create milk entry" do
    visit milk_entries_url
    click_on "New milk entry"

    fill_in "Date", with: @milk_entry.date
    fill_in "Farmer", with: @milk_entry.farmer_id
    fill_in "Quantity", with: @milk_entry.quantity
    fill_in "Time", with: @milk_entry.time
    click_on "Create Milk entry"

    assert_text "Milk entry was successfully created"
    click_on "Back"
  end

  test "should update Milk entry" do
    visit milk_entry_url(@milk_entry)
    click_on "Edit this milk entry", match: :first

    fill_in "Date", with: @milk_entry.date
    fill_in "Farmer", with: @milk_entry.farmer_id
    fill_in "Quantity", with: @milk_entry.quantity
    fill_in "Time", with: @milk_entry.time.to_s
    click_on "Update Milk entry"

    assert_text "Milk entry was successfully updated"
    click_on "Back"
  end

  test "should destroy Milk entry" do
    visit milk_entry_url(@milk_entry)
    click_on "Destroy this milk entry", match: :first

    assert_text "Milk entry was successfully destroyed"
  end
end
