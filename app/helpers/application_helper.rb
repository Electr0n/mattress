module ApplicationHelper
  def currency(value)
    number_to_currency(value,
                      :unit => "",
                      :separator => ".",
                      :delimiter => " ",
                      :precision => 0,
                      :significant => false,
                      :strip_insignificant_zeros => false)
  end
end
