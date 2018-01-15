class Account

  attr_accessor :user_name, :bank_name, :amount

  def initialize(user_name, bank_name, amount)
    @user_name = user_name
    @bank_name = bank_name
    @amount = amount
  end

  def increases_money(amount)
    self.amount += amount
  end

  def decreases_money(amount)
    self.amount -= amount
  end

  def enough_money_for_inter_transfer(amount)
    self.amount >= amount + 5
  end

  def enough_money_for_intra_transfer(amount)
    self.amount >= amount
  end

end