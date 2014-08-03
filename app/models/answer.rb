class Answer < ActiveRecord::Base
  include PublicActivity::Common
  #tracked owner: ->(controller, model) {controller && controller.current_user}

  belongs_to :question
  belongs_to :user
  validates_presence_of :body
  #has_reputation :votes, source: :user, aggregated_by: :sum


  acts_as_votable
end
