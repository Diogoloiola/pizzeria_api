class OrderPromotionalCode < ApplicationRecord
  belongs_to :order
  belongs_to :promotional_code
end
