module PagePartsHelper
  # Options:
  # :wrap_in - html tag to wrap links
  # :separator - delimiter to insert between elements
  def page_parts_menu_links(options = {})
    %w[contact_info payment_and_delivery].map do |key|
      element = link_to PagePart[key].title, page_path(PagePart[key])
      element = content_tag(options[:wrap_in], element.html_safe) if options[:wrap_in]
      element
    end.join(" #{options[:separator]}\n").html_safe
  end
end
