class User < ActiveRecord::Base
    has_attached_file :avatar, :styles => { :medium => "250x250>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage/
  has_many :questions
  has_many :answers

  has_many :evaluations, class_name: "RSEvaluation", as: :source
  has_reputation :votes, source: {reputation: :votes, of: :answers}, aggregated_by: :sum

def voted_for?(answer)
  evaluations.where(target_type: answer.class, target_id: answer).present?
end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
