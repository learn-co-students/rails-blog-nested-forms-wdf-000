class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :post_tags
  has_many :tags, :through => :post_tags
  accepts_nested_attributes_for :tags, reject_if: proc { |attr| attr[:name].blank? } 

  validates_presence_of :name, :content

  # def tags_attributes=(tag_attributes)
  #   unless tag_attributes["name"].empty?
  #     tag = Tag.find_or_create_by(tag_attributes)
  #     post_tags << PostTag.find_or_create_by(post_id: id, tag_id: tag.id)
  #   end
  # end
end
