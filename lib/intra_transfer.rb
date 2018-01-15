require_relative './transfer'

class IntraTransfer < Transfer

  def initialize(payer, receiver, amount)
    super(payer, receiver, amount)
    @commission = 0
  end

  # def enough_money_for_transfer(amount)
  #   super(amount)
  # end

end