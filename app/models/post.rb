class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, presence: true, inclusion: { in: %w(Fiction Non-Fiction) }
  validate  :valid_clickbait_title

  def valid_clickbait_title
    title = self.title || ""
    ["Won't Believe", "Secret", "Top","Guess"].each do |str|
      if title.include?(str)
        return
      end
    end
    errors.add(:title, 'false')
  end

end
