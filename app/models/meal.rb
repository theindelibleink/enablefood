class Meal < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :orders

  def total_cost
    total = 0.0
    orders.each do |o|
      total += o.cost || 0
    end
    return total
  end

  def total_owing
    owing = 0.0
    orders.each do |o|
      owing += o.cost || 0 unless o.has_paid?
    end
    return owing
  end
end
