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
require "test_helper"

class McQuestionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "fixtures are valid" do
    mc_questions.each do |q|
      assert q.valid?,q.errors.full_messages.inspect
    end
  end
end
