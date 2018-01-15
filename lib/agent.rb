require_relative './inter_transfer'
require_relative './intra_transfer'
require 'pry'

class Agent

  def transfer(payer_account, receiver_account, amount, bank_1, bank_2)
    if bank_1.same_bank(bank_2) && payer_account.enough_money_for_intra_transfer(amount)
      transfer_same_bank(payer_account, receiver_account, amount, bank_1)
    elsif !bank_1.same_bank(bank_2) && payer_account.enough_money_for_inter_transfer(amount)

      transfer_different_banks(payer_account, receiver_account, amount, bank_1, bank_2)

    else
      error_message
    end
  end
  def probability_failure # 30% probabilidad de fallo
    probability = rand(1..100)+1
    return probability<=30 ? true : false
  end

  def transfer_same_bank(payer_account, receiver_account, amount, bank)
    transfer = IntraTransfer.new(payer_account, receiver_account, amount)

    transfer.receiver_account.amount += transfer.amount
    transfer.payer_account.amount -= transfer.amount

    bank.add_new_transfer(transfer)
  end

  def transfer_different_banks(payer_account, receiver_account, amount, bank_1, bank_2)
    if probability_failure
      error_message
    else
      if amount <= 1000
        transfer_different_banks_simple(payer_account, receiver_account, amount, bank_1, bank_2)
      else
        transfer_different_banks_complex(payer_account, receiver_account, amount, bank_1, bank_2)
      end
    end
  end

  def transfer_different_banks_complex(payer_account, receiver_account, amount, bank_1, bank_2)
    transfer_times = amount/1000
    transfer_times.times do |i| # vamos haciendo transferencias en paquetes de 1000
      transfer = InterTransfer.new(payer_account, receiver_account, 1000)
      payer_account.decreases_money(1000+transfer.commission) # suponemos que quien ingresa el dinero se hace cargo de las comisiones
      receiver_account.increases_money(1000)

      bank_1.add_new_transfer(transfer)
      bank_2.add_new_transfer(transfer)
    end

    remaining_money = amount % 1000 # el resto de la transferencia
    if remaining_money > 0
      remaining_transfer = InterTransfer.new(payer_account, receiver_account, remaining_money)
      payer_account.decreases_money(remaining_money+remaining_transfer.commission) # suponemos que quien ingresa el dinero se hace cargo de las comisiones
      receiver_account.increases_money(remaining_money)
    end

    bank_1.add_new_transfer(remaining_transfer)
    bank_2.add_new_transfer(remaining_transfer)
  end

  def transfer_different_banks_simple(payer_account, receiver_account, amount, bank_1, bank_2)
    transfer = InterTransfer.new(payer_account, receiver_account, amount)
    transfer.receiver_account.amount += (transfer.amount)
    transfer.payer_account.amount -= transfer.amount+transfer.commission

    bank_1.add_new_transfer(transfer)
    bank_2.add_new_transfer(transfer)
  end

  def error_message
    puts "######## TRANSFER ERROR ######## TRANSFER ERROR ######## TRANSFER ERROR ########"
  end

end