class Question < ActiveRecord::Base

  has_attached_file :qstnimg, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :qstnimg, :content_type => /\Aimage/

  has_many :answers, dependent: :destroy
  belongs_to :user
  validates_presence_of :user

   def self.search(query)
  where("name like ? AND category like ? AND course like ? AND year like ? AND testname like ? AND qno like ?", "%#{query}%","%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%") 

 # if (cateogry.matches => 'Exam Questions')
  #  where("name like ? AND course like ? AND year like ? AND testname like ? AND qno like ?", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%") 
  #else
   #where("name like ?","%#{query}%")
    #end

end

end
