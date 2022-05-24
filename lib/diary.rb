# File: lib/diary.rb
class Diary
  def initialize
    @entries = []
  end

  def add(entry) # entry is an instance of DiaryEntry
    @entries << entry
  end

  def all
    # Returns a list of instances of DiaryEntry
    @entries == [] ? "" : @entries
  end

  def count_words
    count = 0
    @entries.each do |entry|
      count += entry.count_words
    end
    return count
  end

  def reading_time(wpm) # wpm is an integer representing
                        # the number of words the user can read per minute
    # Returns an integer representing an estimate of the reading time in minutes
    # if the user were to read all entries in the diary.
    return (count_words / wpm.to_f).ceil
  end

  def find_best_entry_for_reading_time(wpm, minutes)
    # `wpm` is an integer representing the number of words the user can read
    # per minute.
    # `minutes` is an integer representing the number of minutes the user
    # has to read.
    # Returns an instance of diary entry representing the entry that is closest 
    # to, but not over, the length that the user could read in the minutes they
    # have available given their reading speed.

    # Idea go through each entry, calculate and store its reading time
    # Sort above into decreasing order, step through until find first
    # entry less than or equal to the required reading time
    # return that entry

    # Build array of hashes
    entries_with_times = []
    @entries.each do |e|
      entries_with_times << {:entry => e, :time => e.reading_time(wpm)}
    end
#    puts "entries_with_times is #{entries_with_times}"
    entries_with_times.sort_by! do |e|
      e[:time]
    end
    entries_with_times = entries_with_times.reverse
#    puts "reversed sorted entries_with_times is #{entries_with_times}"
    # return first entry whose reading time is less than or equal to requirement
    entries_with_times.each do |e|
      return e[:entry] if e[:time] <= minutes
    end
    return nil
  end
end
