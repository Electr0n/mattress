module Admin::MattressesHelper
  def mattress_sizes_collection
    MattressStuff::Size.all.map {|size| [size.width_height, size.id] }
  end
end
