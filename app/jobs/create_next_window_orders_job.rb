class CreateNextWindowOrdersJob < ApplicationJob
  queue_as :default

  def perform(*args)
    CreateNextWindowOrders.for
  end
end
