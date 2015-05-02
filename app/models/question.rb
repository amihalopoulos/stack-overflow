class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :votes, as: :voteable
  has_many :tags
  has_many :question_tags
  has_many :tags, through: :question_tags

  has_many :responses, as: :responsible
  validates :title, :content, presence: true

  def all_tags=(tags)
    self.tags = tags.split(", ").map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end

  def all_tags
    self.tags.map(&:name).join(", ")
  end

end
