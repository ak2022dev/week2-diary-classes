# File: lib/diary_entry.rb
class DiaryEntry

  attr_reader :title, :contents

  def initialize(title, contents) # title, contents are strings
    @title = title
    @contents = contents
    @contents_array = contents.split(" ")
    @next_read_from = 0
  end

  def count_words
    @contents.split(" ").length
  end

  def reading_time(wpm) # wpm is an integer representing
                        # the number of words the user can read per minute
    # Returns an integer representing an estimate of the reading time in minutes
    # for the contents at the given wpm.
    (count_words / wpm.to_f).ceil
  end
=begin
  def reading_chunk(wpm, minutes) # `wpm` is an integer representing the number
                                  # of words the user can read per minute
                                  # `minutes` is an integer representing the
                                  # number of minutes the user has to read
    # Returns a string with a chunk of the contents that the user could read
    # in the given number of minutes.
    # If called again, `reading_chunk` should return the next chunk, skipping
    # what has already been read, until the contents is fully read.
    # The next call after that it should restart from the beginning.
    if count_words <= wpm * minutes
      return contents
    end 
  end
=end
  def reading_chunk(wpm, minutes) # `wpm` is an integer representing the number
                                  # of words the user can read per minute
                                  # `minutes` is an integer representing the
                                  # number of minutes the user has to read
    # Returns a string with a chunk of the contents that the user could read
    # in the given number of minutes.
    # If called again, `reading_chunk` should return the next chunk, skipping
    # what has already been read, until the contents is fully read.
    # The next call after that it should restart from the beginning.
    chunk_size = wpm * minutes
    # Number of words left to read in the contents
    words_left = count_words - @next_read_from
    # Index of final word to be output to read
    last_word_to_read = @next_read_from + chunk_size -1
    last_word_to_read = count_words-1 if last_word_to_read >= count_words
    # Return appropriate section of contents and
    # update record of where to read from next
    chunk_string = @contents_array[@next_read_from..last_word_to_read].join(" ").strip
    @next_read_from = (last_word_to_read == count_words - 1) ? 0 : last_word_to_read + 1
    return chunk_string
  end
end
