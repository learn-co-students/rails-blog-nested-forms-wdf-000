class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :post_tags
  has_many :tags, :through => :post_tags
  accepts_nested_attributes_for :tags, reject_if: :all_blank

  # Ask question about this
  # def tags_attributes=(tag_attributes)
  #   tag_attributes.values.each do |tag_attribute|
  #     tag = Tag.find_or_create_by(tag_attribute)
  #     self.tags << tag
  #   end
  # end

  validates_presence_of :name, :content
end
