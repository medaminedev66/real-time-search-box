module SearchesHelper
  def all_keywords!(searches)
    all_words = []
    searches.each do |search|
      words = search.split(/\W+/)
      all_words.concat(words)
    end

    all_words
  end

  def top_5_repeated_keywords(words)
    count_hash = Hash.new(0)
    words.each { |word| count_hash[word] += 1 }
    sorted_hash = count_hash.sort_by { |_key, value| -value }
    top_5_words = sorted_hash.take(5)

    top_5_words.each do |word, count|
      puts "#{word} repeated #{count} times."
    end
  end
end

