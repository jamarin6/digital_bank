class Bank

  attr_accessor :name, :accounts, :transfers

  def self.all
    @all ||= [ ]
  end

  def self.each(&proc)
    @all.each(&proc)
  end

  def initialize(name)
    @name = name
    @accounts = []
    @transfers = []

    Bank.all << self
  end

  def add_new_account(account)
    self.accounts << account
  end

  def add_new_transfer(transfer)
    self.transfers << transfer
  end

  def find_account_by_name(name)
    @accounts.each do |account|
      return account if (account.user_name == name)
    end
  end

  def same_bank(bank_2)
    return self.name==bank_2.name
  end

end