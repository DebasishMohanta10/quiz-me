# == Schema Information
#
# Table name: quizzes
#
#  id          :integer          not null, primary key
#  description :text
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#
# Indexes
#
#  index_quizzes_on_user_id  (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
class Quiz < ApplicationRecord
  belongs_to :user
  has_many :mc_questions,dependent: :destroy
  validates :title,presence: true
  validates :description,presence: true
end
