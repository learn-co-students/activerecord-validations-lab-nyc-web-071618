class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validates :title, non_clickbait: {true}

  def non_clickbait
    clickbait_words_array = ["Won't Believe", "Secret", "Top", "Guess",]
    results_array = []
    clickbait_words_array.each do |word|
      byebug
      if self.title.include?(word)
        results_array << true
      else
        results_array << false
      end
    end
    if results_array.include?(true)
      false
    else
      true
    end
  end
end
