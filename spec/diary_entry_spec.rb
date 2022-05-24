require 'diary_entry.rb'

RSpec.describe DiaryEntry do
  it "Enters the correct fields when a new entry is created" do
    diary_entry = DiaryEntry.new("Monday","My Monday entry")
    expect(diary_entry.title).to eq "Monday"
    expect(diary_entry.contents).to eq "My Monday entry"
  end
  it "Returns the correct number of words in an entry" do
    diary_entry = DiaryEntry.new("Monday","My Monday entry")
    expect(diary_entry.count_words).to eq 3
  end
  it "Returns the correct reading time for an entry" do
    diary_entry = DiaryEntry.new("Monday", "word " * 250)
    expect(diary_entry.reading_time(250)).to eq 1
  end
  it "Returns a whole entry if it's within required chunk size" do
    diary_entry = DiaryEntry.new("Monday", "word " * 250)
    expect(diary_entry.reading_chunk(250,1)).to eq ("word " * 250).strip
  end
  it "Returns successive sub-parts of whole entry if it's not within required chunk size" do
    diary_entry = DiaryEntry.new("Monday", "word " * 250)
    expect(diary_entry.reading_chunk(150,1)).to eq (("word " * 150).strip)
    expect(diary_entry.reading_chunk(150,1)).to eq (("word " * 100).strip)
  end
end
