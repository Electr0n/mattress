class MattressStuff::Size < ActiveRecord::Base
  attr_accessible :height, :width

  def width_height
    [width, height].join('x')
  end
end
