class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post, counter_cache: true
  belongs_to :website, counter_cache: true
  # belongs_to :query
end
