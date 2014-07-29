class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  validates_presence_of :body
  #has_reputation :votes, source: :user, aggregated_by: :sum

  acts_as_votable
end
