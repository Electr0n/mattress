module Admin::ApplicationHelper
  def image_fiels_for(f, image)
    [
      (image_tag(f.object.send(image).url(:processed)) if f.object.send("#{image}?")),
      f.input(image),
      f.input("#{image}_cache", :as => :hidden),
      f.input("remove_#{image}", :as => :boolean)
    ].join("\n").html_safe
  end
end
