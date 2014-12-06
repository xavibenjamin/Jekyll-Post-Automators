#!/usr/bin/env ruby

# *********************************************
# Jekyll Post Generator Awesomeness
# by Cody Krieger (http://codykrieger.com)
# Modified by Tim Smith (http://ttimsmith.com)
# *********************************************


class String

  # from ruby on rails (https://github.com/rails/rails)
  # activesupport/lib/active_support/inflector/transliterate.rb
  def parameterize(sep = '-')
    # replace accented chars with their ascii equivalents
    parameterized_string = self.dup
    # Turn unwanted chars into the separator
    parameterized_string.gsub!(/[^a-z0-9\-_]+/i, sep)
    unless sep.nil? || sep.empty?
      re_sep = Regexp.escape(sep)
      # No more than one of the separator in a row.
      parameterized_string.gsub!(/#{re_sep}{2,}/, sep)
      # Remove leading/trailing separator.
      parameterized_string.gsub!(/^#{re_sep}|#{re_sep}$/i, '')
    end
    parameterized_string.downcase
  end

end

# You want to modify this to the location of you template
TEMPLATE = "/Jekyll-Post-Automaters/video-template.md"

# Change this to where ever your _drafts folder is
POSTS_DIR = "/_drafts"

# Get the title and use it to derive the new filename
title = "{query}"
filename = "#{title.parameterize}"

# Make sure the file doesn't already exist
file_base_path = File.join(POSTS_DIR, filename)
counter = 0
begin
  counter = counter + 1
  if (counter > 1)
    # Counter is above 1, to try appending a number
    filepath = file_base_path + "-" + counter.to_s + ".markdown"
  else
    # First time through this loop: don't use a number on the filename
    filepath = file_base_path + ".markdown"
  end
end while File.exists?(filepath)

# Load in the template and set the title
post_text = File.read(TEMPLATE)
post_text.gsub!('%%TITLE%%', title)

# Write out the post
post_file = File.open(filepath, 'w')
post_file.puts post_text
post_file.close

# Open File in Text Editor
system(%[open "#{filepath}"])
