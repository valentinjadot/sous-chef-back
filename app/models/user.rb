# == Schema Information
#
# Table name: users
#
#  id         :bigint(8)        not null, primary key
#  name       :string           not null
#  vegan      :boolean          default(FALSE)
#  fin        :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_users_on_name  (name) UNIQUE
#
class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :orders, dependent: :destroy

end
