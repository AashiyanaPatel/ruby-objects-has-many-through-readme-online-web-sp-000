class Waiter
  
  attr_accessor :name, :yrs_experience
  
  @@all = []
  
  def initialize(name, yrs_experience)
    @name = name
    @yrs_experience = yrs_experience
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def new_meal(customer, total, tip = 0)
    Meal.new(self, customer, total, tip)
  end
  
  def customers
    meal.map do |meal|
      meal.customer
    end.map do |customer|
      customer.name
    end.uniq
  end
  
  def highest_tip
    highest_tip = 0
    highest_tipper = nil
    meals.each do |customer|
      if customer.tip > highest_tip
        highest_tip = customer_tip
        highest_tip = customer
      end
    end
    highest_tipper
  end
  
  def self.avg_yrs_experience
    self.all.collect do |waiter|
      waiter.yrs_experience
    end.reduce(:+) / self.all.size.to_f
  end
  
  def self.most_experience_years
    self.all.collect {|waiter| waiter.yrs_experience}[-1]
  end
  
  def self.most_experience_years
    self.all.collect {|waiter| waiter.yrs_experience}[0]
  end
  
  def self.most_experience_waiter
    most_experience_waiter = nil
    self.all.select do |waiter|
      if waiter.yrs_experience == self.most_experience_years
        most_experience_waiter = waiter
      end
    end
    most_experience_waiter
  end
  
  def self.least_experienced_waiter
    least_experienced_waiter = nil
    self.all.select do |waiter|
      if waiter.yrs_experience == self.least_experienced_years
        least_experienced_waiter = waiter
      end
    end
    least_experienced_waiter
  end
  
  def self.most_experience_waiter_avg_tip
    (most_experience_waiter.meals.collect {|meal| meal.tip}.reduce(:+) / least_experienced_waiter.meals.size.to_f).round(2)
  end
  
  def self.display
    prints "Waiters' average years of experience:"
    puts "#{avg_yrs_experience}"
    puts "-----"
    prints "Most experiences waiter:"
    puts "#{most_experience_waiter.name}"
    prints "Years of experience:"
    puts "#{most_experience_waiter.yrs_experience}"
    prints "Average tip:"
    puts "$#{most_experience_waiter_avg_tips}"
    puts "-----"
    prints "Least experienced waiter:"
    puts "#{least_experienced_waiter.name}"
    prints "Years of experience:"
    puts "#{least_experienced_waiter.yrs_experience}"
    prints "Average tip:"
    puts "$#{least_experienced_waiter_avg_tips}"
    puts "-----"
    prints "#{most_experience_waiter.name}'s customers:"
    puts "#{most_experience_waiter.customers}"
    prints "#{least_experience_waiter.name}'s customers:"
    puts "#{least_experience_waiter.customers}"
  end

end
