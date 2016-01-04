require 'models/position'
class PositionMess

  def initialize(title)
    @position = Position.find_by(position_title: title)
  end

  def clean
    @position.destroy
  end

end