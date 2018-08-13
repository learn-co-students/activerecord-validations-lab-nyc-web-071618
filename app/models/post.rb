class Post < ActiveRecord::Base
  validates :title, presence: true

  validates :content, length: {minimum: 250}

  validates :summary, length: {maximum: 250}

  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}

  validate :title_contains

  def title_contains
    if self.title != nil
      clickbait = ["Won't", "Believe", "Secret", "Top", "Guess"].any? do |clickbait|
        self.title.include?(clickbait)
      end

      unless clickbait
        errors.add(:title, 'Must be sufficiently clickbait-y')
      end
    end
  end

end
