class Question < ActiveRecord::Base

  has_attached_file :qstnimg, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :qstnimg, :content_type => /\Aimage/

  has_many :answers, dependent: :destroy
  belongs_to :user
  validates_presence_of :user, :name, :description, :category
  validates_length_of :name, :description, :minimum =>30

  validates_presence_of :course,:year, :testname, :qno, :if => lambda {category == "Exam Question"}

  def self.search(params)
    # puts "========\n\n\n#{search}\n\n\n"

    name = params[:question][:name]
    category = params[:question][:category]
    course = params[:question][:course]
    testname = params[:question][:course]
    where("name like ? AND category like ? AND course like ? AND testname like ?", "%#{name}%", "%#{category}%", "%#{course}%", "%#{testname}") 
  end


end
