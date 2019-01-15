class Card
  
  attr_reader :face
  attr_reader :suit
  attr_reader :value, :extra
  
  def initialize (args)
    @face = args[:face]
    @suit = args[:suit]
    @value = args[:value]
    @extra = args[:extra]
  end

  def self.shirt
    @shirt ||= Card.new(face:"*", suit:"*", value:0, extra:0)
  end

end
