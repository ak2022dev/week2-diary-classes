require "diary"
require "diary_entry"

RSpec.describe "integration" do
  it "returns a single entry if only one entered into new diary" do
    entry = DiaryEntry.new("Monday", "My Monday entry")
    diary = Diary.new
    diary.add(entry)
    expect(diary.all).to eq [entry]
  end
  it "returns both entries if two are entered into a new diary" do
    entry = DiaryEntry.new("Monday", "My Monday entry")
    entry2 = DiaryEntry.new("Tuesday", "My Tuesday entry")
    diary = Diary.new
    diary.add(entry)
    diary.add(entry2)
    expect(diary.all).to eq [entry, entry2]
  end
  it "returns the correct word count adding words from contents of all entries" do
    entry = DiaryEntry.new("Monday", "My Monday entry")
    entry2 = DiaryEntry.new("Tuesday", "My Tuesday entry")
    diary = Diary.new
    diary.add(entry)
    diary.add(entry2)
    expect(diary.count_words).to eq 6
  end
  it "returns the correct reading time adding words from contents of all entries when exact number of minutes match the entries" do
    entry = DiaryEntry.new("Monday", "word " * 250)
    entry2 = DiaryEntry.new("Tuesday", "word " * 500)
    diary = Diary.new
    diary.add(entry)
    diary.add(entry2)
    expect(diary.reading_time(250)).to eq 3
  end
  it "returns the correct reading time adding words from contents of all entries when needing to round-up minutes" do
    entry = DiaryEntry.new("Monday", "word " * 450)
    entry2 = DiaryEntry.new("Tuesday", "word " * 750)
    diary = Diary.new
    diary.add(entry)
    diary.add(entry2)
    expect(diary.reading_time(250)).to eq 5
  end
  it "returns the only available entry for a given reading time given wpm and mins if appropriate" do
    entry = DiaryEntry.new("Monday", "word " * 450)
    diary = Diary.new
    diary.add(entry)
    expect(diary.find_best_entry_for_reading_time(250,2)).to eq entry    
  end
  it "it ignores too-long entries in returning the best entry for a given reading time given wpm and mins" do
    entry = DiaryEntry.new("Monday", "word " * 450)
    entry2 = DiaryEntry.new("Tuesday", "word " * 550)
    diary = Diary.new
    diary.add(entry)
    diary.add(entry2)
    expect(diary.find_best_entry_for_reading_time(250,2)).to eq entry    
  end
  it "it ignores too-short entries in returning the best entry for a given reading time given wpm and mins" do
    entry = DiaryEntry.new("Monday","word " * 450)
    entry2 = DiaryEntry.new("Tuesday","word " * 550)
    diary = Diary.new()
    diary.add(entry)
    diary.add(entry2)
    expect(diary.find_best_entry_for_reading_time(300, 2)).to eq entry2
  end
  it "it returns empty if all of the entries are too long for a given reading time given wpm and mins" do
    entry = DiaryEntry.new("Monday","word " * 450)
    entry2 = DiaryEntry.new("Tuesday","word " * 550)
    diary = Diary.new()
    diary.add(entry)
    diary.add(entry2)
    expect(diary.find_best_entry_for_reading_time(300, 1)).to eq nil
  end
end
