class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length:{minimum:250}
  validates :summary, length:{maximum:250}
  validates :category, inclusion:{in:["Fiction","Non-Fiction"]}
  validate :valid_clickbait

  def valid_clickbait
    return false unless self.title
    array = ["Won't Believe", "Secret", /Top \d/, "Guess"]
    array.each{|str|
      return true if title.match(str)
    }
    errors.add(:title, "non clickbait")
  end

end
