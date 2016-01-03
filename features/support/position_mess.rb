require 'models/position'
class PositionMess

  def initialize(position_name)
    @position = Position.find_by(name: position_name)
  end

  def clean
    @position.destroy
  end

end