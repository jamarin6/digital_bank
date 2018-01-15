require 'rspec/core'
require_relative '../lib/account'
require_relative '../lib/agent'
require_relative '../lib/bank'
require_relative '../lib/inter_transfer'
require_relative '../lib/intra_transfer'
require_relative '../lib/transfer'

RSpec.describe do

  context 'bank' do
    describe ".same_bank" do
      it "return false if different bank" do
        bank_1 = Bank.new("Genova Bank")
        bank_2 = Bank.new("Happy Bank")

        expect(bank_1.same_bank(bank_2)).to be false
      end
    end

    describe ".same_bank" do
      it "return true if same bank" do
        bank_1 = Bank.new("Genova Bank")
        bank_2 = Bank.new("Genova Bank")

        expect(bank_1.same_bank(bank_2)).to be true
      end
    end

    describe ".add_new_account" do
      it "increases accounts" do
        bank_1 = Bank.new("Genova Bank")
        account_1 = Account.new("Mariano", "Genova Bank", 500)

        expect{bank_1.add_new_account(account_1)}.to change{bank_1.accounts.count}.from(0).to(1)
      end
    end

    describe ".add_new_transfer" do
      it "increases transfers" do
        bank_1 = Bank.new("Genova Bank")
        account_1 = Account.new("Mariano", "Genova Bank", 500)
        account_2 = Account.new("Luis", "Genova Bank", 700)
        transfer = IntraTransfer.new(account_2, account_1, 300)

        expect{bank_1.add_new_transfer(transfer)}.to change{bank_1.transfers.count}.from(0).to(1)
      end
    end

  end

  context 'account' do
    describe "initializes accounts" do
      it "initial amount is in account" do
        account_1 = Account.new("Mariano", "Genova Bank", 500)
        account_2 = Account.new("Luis", "Genova Bank", 800)

        expect(account_1.amount).to eq(500)
        expect(account_2.amount).to eq(800)
      end
    end

    describe ".increases_money" do
      it "increases account money" do
        account_1 = Account.new("Mariano", "Genova Bank", 500)

        expect(account_1.increases_money(150)).to eq(650)
      end
    end

    describe ".decreases_money" do
      it "decreases account money" do
        account_2 = Account.new("Luis", "Genova Bank", 800)

        expect(account_2.decreases_money(100)).to eq(700)
      end
    end

    describe ".enough_money_for_inter_transfer" do
      it "not enough money for inter-transfer" do
        account_1 = Account.new("Luis", "Genova Bank", 800)

        expect(account_1.enough_money_for_inter_transfer(800)).to be false
      end
    end

    describe ".enough_money_for_inter_transfer" do
      it "enough money for inter-transfer" do
        account_1 = Account.new("Luis", "Genova Bank", 805)

        expect(account_1.enough_money_for_inter_transfer(800)).to be true
      end
    end

    describe ".enough_money_for_intra_transfer" do
      it "not enough money for intra-transfer" do
        account_1 = Account.new("Luis", "Genova Bank", 800)

        expect(account_1.enough_money_for_intra_transfer(800)).to be true
      end
    end

    describe ".enough_money_for_intra_transfer" do
      it "enough money for intra-transfer" do
        account_1 = Account.new("Luis", "Genova Bank", 800)

        expect(account_1.enough_money_for_intra_transfer(805)).to be false
      end
    end
  end

end

