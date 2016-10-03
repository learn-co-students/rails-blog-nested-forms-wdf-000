class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :post_tags
  has_many :tags, :through => :post_tags

  accepts_nested_attributes_for :tags, reject_if: proc { |attributes| attributes['name'].blank? }

  def tags_attributes=(tag_attributes)
    if tag_attributes.class != Array
      if !tag_attributes.values[0][:name].empty?
        tag_attributes.values.each do |t|
          tag = Tag.find_or_create_by(name: t[:name])
          self.tags << tag
        end
      end
    end
  end

  validates_presence_of :name, :content
end
