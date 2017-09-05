class Post < ActiveRecord::Base

  validates :title, presence: true
  validates :content, length: { :minimum => 250 }
  validates :summary, length: { :maximum => 250 }
  validates :category, inclusion: { in: ["Fiction", "Non-Fiction"] }
  validate  :validateCB
  # validates :title, inclusion: { in: %w( "Won't Believe" "Secret" "Guess" "Top") }
  def validateCB
    ["Won't Believe", "Secret", "Guess", "Top"].each do |t|
      if  self.title != nil && self.title.include?(t)
        return true
      end
    end
    errors.add(:title, "Error!")
  end
end
