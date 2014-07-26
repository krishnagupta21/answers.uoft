class Question < ActiveRecord::Base

  has_attached_file :qstnimg, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :qstnimg, :content_type => /\Aimage/

  has_many :answers, dependent: :destroy
  belongs_to :user
  validates_presence_of :user

  def self.search(params)
    # puts "========\n\n\n#{search}\n\n\n"

    name = params[:question][:name]
    category = params[:question][:category]
    course = params[:question][:course]
    q = ""
    #if name and name != ""
   #   q += " name like ? "
    #end
    #if category and category != ""
    #  q +=" name like = ? "
    #end
    #if course and course != ""
    #  q +=" name like = ? "
   # end
   
    where("name like ? AND category like ? AND course like ?", "%#{name}%", "%#{category}%", "%#{course}%") 
  end

end
