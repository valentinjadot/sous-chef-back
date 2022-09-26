# == Schema Information
#
# Table name: orders
#
#  id             :bigint(8)        not null, primary key
#  user_id        :bigint(8)        not null
#  vegan          :boolean          default(FALSE)
#  take_away      :boolean          default(FALSE)
#  active         :boolean          default(TRUE)
#  meal           :integer
#  sent_at        :datetime
#  execution_date :date             not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_orders_on_user_id                              (user_id)
#  index_orders_on_user_id_and_execution_date_and_meal  (user_id,execution_date,meal) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Order < ApplicationRecord
  MEALS = %i[lunch dinner]
  belongs_to :user
  enum meal: MEALS
  validates :execution_date, presence: true
  validates :execution_date, uniqueness: { scope: %i[user_id meal] }

  WINDOW_SIZE_IN_DAYS = 7
  MEALS_PER_DAY = 2

  scope :today, -> { where('execution_date IN (?)', [Time.now.to_date]) }
  scope :tomorrow, -> { where('execution_date IN (?)', [Time.now.to_date + 1.day]) }
  scope :after_tomorrow, -> { where('execution_date IN (?)', [Time.now.to_date + 2.day]) }
  scope :next_window, -> { where('execution_date IN (?)', next_window_days) }
  scope :active, -> { where(active: true) }

  def self.next_window_days
    GetNextWindowDays.for
  end
end
