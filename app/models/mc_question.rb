# == Schema Information
#
# Table name: mc_questions
#
#  id           :integer          not null, primary key
#  answer       :string
#  distractor_1 :string
#  distractor_2 :string
#  question     :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  quiz_id      :integer
#
# Indexes
#
#  index_mc_questions_on_quiz_id  (quiz_id)
#
# Foreign Keys
#
#  quiz_id  (quiz_id => quizzes.id)
#
class McQuestion < ApplicationRecord
  belongs_to :quiz
  validates :question,presence: true,uniqueness: true
  validates :answer,presence: true
  validates :distractor_1,presence: true
end
