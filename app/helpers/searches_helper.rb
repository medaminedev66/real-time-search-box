module SearchesHelper
  def all_words!(searches)
    all_words = []
    searches.each do |search|
      words = search.downcase.split(/\W+/)
      all_words.concat(words)
    end

    all_words
  end

  def filter_words(words)
    conjunctions_set = Set.new(%w[i you he she it we they mine yours his hers its
                                  ours theirs and or but so for nor yet since the a an am are is])
    words.reject { |word| conjunctions_set.include?(word.downcase) }
  end

  def top_5_repeated_keywords(words)
    count_hash = Hash.new(0)
    words.each { |word| count_hash[word] += 1 }
    sorted_hash = count_hash.sort_by { |_key, value| -value }
    sorted_hash.take(5)
  end
end
