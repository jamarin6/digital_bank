require_relative './transfer'

class InterTransfer < Transfer

  def initialize(payer, receiver, amount)
    super(payer, receiver, amount)
    @commission = 5
  end

  # def enough_money_for_transfer(amount)
  #   (this.payer_account.amount + 5) >= amount
  # end

end