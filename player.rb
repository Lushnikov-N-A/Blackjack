class Player < Players
  include Validation
    
  def initialize (name, bankroll, hand)
    @name = name
    validate_name!
    super
  end
end
