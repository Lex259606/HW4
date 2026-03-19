class Entry < ApplicationRecord
  belongs_to :place
  
  # This line is the "magic" that fixes the NoMethodError in your controller
  has_one_attached :uploaded_image
end