class CreateNextWindowOrders < PowerTypes::Command.new
  TOTAL_ORDERS_PER_WINDOW = Order::WINDOW_SIZE_IN_DAYS * Order::MEALS_PER_DAY

  def perform
    return unless user_id_with_missing_orders.present?

    create_missing_orders
  end

  def create_missing_orders
    next_days.map { |date| create_orders_for(date) }
  end

  def next_days
    Order.next_window_days
  end

  def create_orders_for(date)
    user_id_with_missing_orders.map do |user_id, _orders_count|
      Order::MEALS.map do |meal|
        create_order(user_id, date, meal) unless order_already_exists?(user_id, date, meal)
      end
    end
  end

  def create_order(user_id, date, meal)
    user = User.find(user_id)
    Order.create!(
      user_id: user_id,
      active: user.fin,
      vegan: user.vegan,
      meal: meal,
      execution_date: date
    )
  end

  def order_already_exists?(user_id, date, meal)
    Order.where(
      user_id: user_id,
      execution_date: date,
      meal: meal
    ).exists?
  end

  def user_id_with_missing_orders
    orders_count_per_user_id.filter do |_user_id, orders|
      orders < TOTAL_ORDERS_PER_WINDOW
    end
  end

  def orders_count_per_user_id
    all_users_id.merge(existing_orders_count_per_user_id) do |_key, value_a, value_b|
      value_a + value_b
    end
  end

  def existing_orders_count_per_user_id
    Order.next_window.group(:user_id).count(:id)
  end

  def all_users_id
    User.pluck(:id, 0).to_h
  end
end
