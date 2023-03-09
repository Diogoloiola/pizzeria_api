class Order < ApplicationRecord
  enum status: {
    open: 0,
    running: 1,
    finished: 2
  }
end
