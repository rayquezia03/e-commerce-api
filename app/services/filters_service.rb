class FiltersService
  def self.status_options
    Order.pluck(:status).uniq
  end

  def self.user_options
    User.pluck(:name, :id).map { |name, id| [name, id] }.uniq
  end
end