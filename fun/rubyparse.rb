def parser (filename)
  f = File.new(filename,'r')
  wordarr = f.read.split(' ')
  words = Hash.new(0)
  for word in wordarr
    words[word]+=1
  end
  mx = words.values.max
 
  ind = words.index(mx)
  
  return ind
  
    
end

class Document
  def initialize(file,title,fontsize = 10)
    @title = title
    @fontsize = fontsize
    @content = File.new(file,'r').read
    @contentli = @content.split(' ')
    common =<<words   
   1. the
   2. of
   3. and
   4. a
   5. to
   6. in
   7. is
   8. you
   9. that
  10. it
  11. he
  12. was
  13. for
  14. on
  15. are
  16. as
  17. with
  18. his
  19. they
  20. I 
  21. at
  22. be
  23. this
  24. have
  25. from
  26. or
  27. one
  28. had
  29. by
  30. word
  31. but
  32. not
  33. what
  34. all
  35. were
  36. we
  37. when
  38. your
  39. can
  40. said 
  41. there
  42. use
  43. an
  44. each
  45. which
  46. she
  47. do
  48. how
  49. their
  50. if
  51. will
  52. up
  53. other
  54. about
  55. out
  56. many
  57. then
  58. them
  59. these
  60. so 
  61. some
  62. her
  63. would
  64. make
  65. like
  66. him
  67. into
  68. time
  69. has
  70. look
  71. two
  72. more
  73. write
  74. go
  75. see
  76. number
  77. no
  78. way
  79. could
  80. people 
  81. my
  82. than
  83. first
  84. water
  85. been
  86. call
  87. who
  88. oil
  89. its
  90. now
  91. find
  92. long
  93. down
  94. day
  95. did
  96. get
  97. come
  98. made
  99. may
 100. part 
words
  @com = common.split('.')
    for word in @com
      if word.to_i
        puts word
        @com.delete(word)
      else
        word.delete!(' ')
      end
    end
  #puts @com
  end

  def title
    #return @title
  end

  def fontsize
    #return @fontsize
  end
  
  def content
    #return @content
  end

  def wordcount
    #return contentli.length
  end

end
