class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :post_tags
  has_many :tags, :through => :post_tags

  validates_presence_of :name, :content

  accepts_nested_attributes_for :tags, reject_if: :empty_tagname?


    def empty_tagname?(tag_attr)
      tag_attr[:name].nil? ? true : tag_attr[:name].empty? 
    end
end
