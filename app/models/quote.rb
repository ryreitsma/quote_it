class Quote < ActiveRecord::Base
  belongs_to :author
  scope :random, -> { offset(rand(count)) }
end
