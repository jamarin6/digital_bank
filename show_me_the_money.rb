require './lib/account'
require './lib/agent'
require './lib/bank'
require 'pry'

bank_one = Bank.new("Bank_one")
bank_two = Bank.new("Bank_two")

jim_account = Account.new("Jim", "Bank_one", 35000)
emma_account = Account.new("Emma", "Bank_two", 50000)

bank_one.accounts << jim_account
bank_two.accounts << emma_account

puts "--------------- situacion bancos antes de transferencia --------------"
Bank.all.each do |bank|
  bank.accounts.map { |account| puts "del banco: " + bank.name + " la cuenta: " + account.user_name + " tiene: " + account.amount.to_s + " de balance " }
end
puts "------------------ ------------------------ --------------------------"
puts "------------------ ------------------------ --------------------------"
puts "------------------ ------------------------ --------------------------"

puts "-*-*-*-*-*-*-*-*-*-*-*-*--*-*-*-*-*-*-*-*-*-*-*-*-"
puts "-*-*-*-*-*-*-*-*-*-*-*-*--*-*-*-*-*-*-*-*-*-*-*-*-"
puts "Empieza el caso concreto de Jim y Emma"

puts "-------- Situación inicial --------"
puts "-*-*-*- jim account ==> " + jim_account.amount.to_s + "-*-*-*-"
puts "-*-*-*- emma account => " + emma_account.amount.to_s + "-*-*-*-"

agent = Agent.new()

agent.transfer(jim_account, emma_account, 20000, bank_one, bank_two)

puts "-------- Situación final (el que transfiere paga la comisión) --------"
puts "-*-*-*- jim account ****> " + jim_account.amount.to_s + "-*-*-*-"
puts "-*-*-*- emma account ***> " + emma_account.amount.to_s + "-*-*-*-"
puts "-*-*-*-*-*-*-*-*-*-*-*-*-*"
puts "-*-*-*-*-*-*-*-*-*-*-*-*-*"
puts "-*-*-*-*-*-*-*-*-*-*-*-*--*-*-*-*-*-*-*-*-*-*-*-*-"
puts "-*-*-*-*-*-*-*-*-*-*-*-*--*-*-*-*-*-*-*-*-*-*-*-*-"

puts "------------------------"
puts "------------------------"
puts "------------------------"
puts "------------------------"

puts "--------------- situacion bancos después de transferencia --------------"
Bank.all.each do |bank|
  bank.accounts.map { |account| puts "del banco: " + bank.name + " la cuenta: " + account.user_name + " tiene: " + account.amount.to_s + " de balance " }
end
puts "------------------ ------------------------ ----------------------------"
puts "------------------ ------------------------ ----------------------------"
puts "------------------ ------------------------ ----------------------------"