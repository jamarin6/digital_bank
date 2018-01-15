class Transfer

  attr_accessor :payer_account, :receiver_account, :amount, :commission

  def initialize(payer_account, receiver_account, amount)
    @payer_account = payer_account
    @receiver_account = receiver_account
    @amount = amount
  end

  # def enough_money_for_transfer(amount)
  #   this.payer_account.amount >= amount
  # end

end