class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :post_tags
  has_many :tags, :through => :post_tags

  validates_presence_of :name, :content

  # accepts_nested_attributes_for :tags

  accepts_nested_attributes_for :tags, reject_if: lambda {|attributes| attributes['name'].blank?}


    def tags_attributes=(tag_attributes)
      # tag_attributes.values.each do |tag_attribute|
        tag_attributes.each do |index, tag_attribute|
        # if tag_attribute[:name].present?
          tag = Tag.find_or_create_by(tag_attribute)
            self.post_tags.build(:tag => tag)
          # ^^^ instantiating an instance of the join model and putting the tag in
          # self.tag << tag -- inefficient
          # end
        # end
      end
    end

end
