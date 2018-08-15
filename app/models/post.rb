class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction), message: "%{value} is not a valid Category." }
  validate :clickbait

  def clickbait
    return false unless title

    clickbait = ["Won't Believe", "Secret", "Top [number]", "Guess"]

    clickbait.each do |str|
      if title.include?(str)
        return true
      end
    end

    errors.add(:title, "needs clickbait!")
  end

end # end of Post class
