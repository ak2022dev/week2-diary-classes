_diary integration_

#1
diary_entry = DiaryEntry.new("Monday","My Monday entry")
diary = Diary.new()
diary.add(diary_entry)
diary.all() # => "Diary entries: Monday - My Monday entry"

#2
diary_entry = DiaryEntry.new("Monday","My Monday entry")
diary_entry2 = DiaryEntry.new("Tuesday","My Tuesday entry")
diary = Diary.new()
diary.add(diary_entry)
diary.add(diary_entry2)
diary.all() # => "Diary entries: Monday - My Monday entry, Tuesday - My Tuesday entry"

#3
diary_entry = DiaryEntry.new("Monday","My Monday entry")
diary_entry2 = DiaryEntry.new("Tuesday","My Tuesday entry")
diary = Diary.new()
diary.add(diary_entry)
diary.add(diary_entry2)
diary.count_words() # => 6

#4
diary_entry = DiaryEntry.new("Monday","word " * 250)
diary_entry2 = DiaryEntry.new("Tuesday","word " * 500)
diary = Diary.new()
diary.add(diary_entry)
diary.add(diary_entry2)
diary.reading_time(250) # => 3

#5
diary_entry = DiaryEntry.new("Monday","word " * 450)
diary_entry2 = DiaryEntry.new("Tuesday","word " * 750)
diary = Diary.new()
diary.add(diary_entry)
diary.add(diary_entry2)
diary.reading_time(250) # => 5 (round up to nearest integer)

#6
diary_entry = DiaryEntry.new("Monday","word " * 450)
diary = Diary.new()
diary.add(diary_entry)
diary.find_best_entry_for_reading_time(250, 2) # => "Diary entries: Monday - "word " * 450

#7
diary_entry = DiaryEntry.new("Monday","word " * 450)
diary_entry2 = DiaryEntry.new("Tuesday","word " * 550)
diary = Diary.new()
diary.add(diary_entry)
diary.add(diary_entry2)
diary.find_best_entry_for_reading_time(250, 2) # => "Diary entries: Monday - "word " * 450"

#8
diary_entry = DiaryEntry.new("Monday","word " * 450)
diary_entry2 = DiaryEntry.new("Tuesday","word " * 550)
diary = Diary.new()
diary.add(diary_entry)
diary.add(diary_entry2)
diary.find_best_entry_for_reading_time(300, 2) # => "Diary entries: Tuesday - "word " * 550"


_diary_entry_

#1
diary_entry = DiaryEntry.new("Monday","My Monday entry")
diary_entry.title() # => "Monday"
diary_entry.contents() # => "My Monday entry"

#2
diary_entry = DiaryEntry.new("Monday","My Monday entry")
diary_entry.count_words() # => 3

#3
diary_entry = DiaryEntry.new("Monday", "word " * 250)
diary_entry.reading_time(250) # => 1

#4
diary_entry = DiaryEntry.new("Monday", "word " * 250)
diary_entry.reading_chunk(250,1) # => "word " * 250
(idea maybe this or another method could return a boolean?)

#4
diary_entry = DiaryEntry.new("Monday", "word " * 250)
diary_entry.reading_chunk(150,1) # => "word " * 150
diary_entry.reading_chunk(150,1) # => "word " * 100
(idea maybe this or another method could return a boolean?)


_diary_

#1
diary = Diary.new()
expect (diary.all).to eq ""

#2
diary = Diary.new()
expect(diary.count_words).to eq 0

#3
diary = Diary.new()
expect(diary.reading_time(250)).to eq 0 

#4
diary = Diary.new()
expect(diary.find_best_entry_for_reading_time(250, 2)).to eq nil 

