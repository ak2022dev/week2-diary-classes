require 'diary'

RSpec.describe Diary do
  it "Returns empty string if all entries listed for new diary" do
    diary = Diary.new
    expect(diary.all).to eq ""
  end
  it "Returns zero for count of words in empty diary" do
    diary = Diary.new
    expect(diary.count_words).to eq 0
  end
  it "Returns reading time of zero for empty diary" do
    diary = Diary.new
    expect(diary.reading_time(250)).to eq 0
  end
  it "Returns nil for best entry for given reading time if diary empty" do
    diary = Diary.new
    expect(diary.find_best_entry_for_reading_time(250, 2)).to eq nil 
  end
end
