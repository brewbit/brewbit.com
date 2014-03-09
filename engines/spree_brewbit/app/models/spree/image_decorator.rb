Spree::Image.class_eval do
  attachment_definitions[:attachment][:styles] = {
    :mini => '60x48#', # thumbs under image
    :small => '160x122#', # images on category view
    :product => '340x246#', # full product image
    :large => '600x600#' # light box image
  }
end