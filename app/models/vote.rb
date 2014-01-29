class Vote < ActiveRecord::Base
  belongs_to :story
  belongs_to :user
  scope :upvotes, -> { where(up: true) }
  scope :downvotes, -> { where(up: false) }
end
