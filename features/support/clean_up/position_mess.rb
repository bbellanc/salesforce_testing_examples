require 'models/position'
class PositionMess
  attr_reader :position

  def initialize(title)
    @position = Position.find_by(position_title: title)
  end

  def clean
    position_to_clean = @position.reload
    position_to_clean.destroy if position_to_clean
  end

end