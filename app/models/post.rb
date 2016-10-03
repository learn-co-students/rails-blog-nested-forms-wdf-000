class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :post_tags
  has_many :tags, :through => :post_tags
  accepts_nested_attributes_for :tags, reject_if: proc {|attributes| attributes['name'].blank?}


  validates_presence_of :name, :content

  # def tags_attributes=(tag_attributes)
  #     tag_attributes.values.each do |tag_attribute|
  #       tag = Tag.find_or_create_by(tag_attribute)
  #       self.tags << tag
  #       end
  #   else
  #
  # end
end
