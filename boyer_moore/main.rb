class PatternSearch
  attr_accessor :flag

  CHARS = 256

  def initialize(text_filename, pattern_filename)
      @pattern_file_name = pattern_filename
      @text_file_name = text_filename
      @flag = false
  end


  def main
    txt = ''
    pat = ''
    size = 0
    position = 0
    i = 0

    puts "____Text____\n"
    File.open(@text_file_name, "r") do |text_file|
      text_file.each_line do |line|
        puts line
        txt += line
      end
    end

    size = txt.length
    if size <= 0 
      puts "File with text is empty, fill it!\n\n"
      return
    end

    n = txt.length
    puts "\nLength of the text: #{n}\n\n"

    puts "\n____Pattern____\n"
    File.open(@pattern_file_name, "r") do |pattern_file|
      pattern_file.each_line do |line|
        puts line
        pat += line
      end
    end

    size = pat.length
    if size <= 0 
      puts "File with pattern is empty, fill it!\n\n"
      return
    end

    m = pat.length

    puts "\nLength of the pattern: #{m}\n\n\n"

    search(txt, pat, n, m)

    if @flag == false
      puts "Pattern was not found in the text!!!\n\n"
    end
  end
  
  private

  def max(a, b)
    a > b ? a : b
  end


  def bad_char_heuristic(str, size)
    badchar = Array.new(CHARS, -1)

    str.each_byte.with_index do |char, i|
      badchar[char] = i
    end

    badchar
  end


  def preprocess_strong_suffix(shift, bpos, pat, m)
    i, j = m, m + 1
    bpos[i] = j

    while i > 0
      while j <= m && pat[i - 1] != pat[j - 1]
        if shift[j] == 0
          shift[j] = j - i
        end
        j = bpos[j]
      end

      i -= 1
      j -= 1
      bpos[i] = j
    end
  end


  def preprocess_case2(shift, bpos, pat, m)
    j = bpos[0]

    (0..m).each do |i|
      shift[i] = j if shift[i] == 0
      j = bpos[j] if i == j
    end
  end


  def search(text, pat, n, m)
    s = 0
    s_good_suffix = 0
    s_bad_char = 0

    badchar = bad_char_heuristic(pat, m)
    bpos = Array.new(m + 1, 0)
    shift_gs = Array.new(m + 1, 0)

    shift_gs.map! do |_|
      0
    end

    preprocess_strong_suffix(shift_gs, bpos, pat, m)
    preprocess_case2(shift_gs, bpos, pat, m)

    while s <= (n - m)
      j = m - 1

      while j >= 0 && pat[j] == text[s + j]
        j -= 1
      end

      if j < 0
        puts "Pattern occurs at shift = #{s + 1}"
        @flag = true
        s_good_suffix += shift_gs[0]
        s_bad_char += (s_bad_char + m < n) ? m - badchar[text[s_bad_char + m].ord] : 1
        s = max(s_bad_char, s_good_suffix)
      else
        s_bad_char += max(1, j - badchar[text[s_bad_char + j].ord])
        s_good_suffix += shift_gs[j + 1]
        s = max(s_bad_char, s_good_suffix)
      end
    end
  end

end



pattern_search = PatternSearch.new("text.txt", "pattern.txt")
pattern_search.main