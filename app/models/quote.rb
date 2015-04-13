class Quote < ActiveRecord::Base
  belongs_to :author
  scope :random, -> { offset(rand(count)) }

  delegate :name, to: :author, prefix: true
end
