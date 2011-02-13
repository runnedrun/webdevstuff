def funfun(st,as)
  t = Proc.new {|stuff|
    print stuff
    print as + 34 
  }
 
  t.call st
end

class Meclass

  def initialize(pl)
    print pl
  end

  def plo ()
    @plo
  end

  def plo = (me)
    @plo = me
  end

end
