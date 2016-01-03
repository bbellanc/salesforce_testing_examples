require 'models/position'
class PositionMess

  def initialize(title)
    @position = Position.find_by(title)
  end

  def clean
    @position.destroy
  end

end