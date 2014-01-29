require 'pismo'
require 'link_thumbnailer'

class Story < ActiveRecord::Base
  belongs_to :user
  has_many :votes


  def points
    votes.upvotes.count - votes.downvotes.count
  end

  def self.page_preview(url)
    doc = Pismo::Document.new(url)
    page = {title: doc.title, opening: doc.body}
  end

  def self.page_image(url)
    doc = LinkThumbnailer.generate(url)
    image = { image: doc.image }
  end

end
