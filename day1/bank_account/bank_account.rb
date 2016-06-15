class BankAccount
  attr_accessor :checking_balance, :saving_balance, :accountNumber
  @@no_account = 0

  def initialize
    @checking_balance = 0
    @saving_balance = 0
    @@no_account += 1
    @accountNumber = generate_account
    @interest_rate = 2.49
  end

  public
  def account_number
    puts "Your account number is #{@accountNumber}"
  end

  def number_of_accounts
    puts @@no_account
  end

  def deposit(account, amount)
    if account == 'C'
      @checking_balance += amount
    else
      @saving_balance += amount
    end
  end

  def withdrawal(account, amount)
    if account == 'C'
      if !(@checking_balance < amount)
        @checking_balance -= amount
      else
        puts "You don't have enough amount in your checking account. Your current balance is #{@checking_balance}. Deposit more money or enter less amount!!!"
      end
    else
      if !(@saving_balance < amount)
        @saving_balance -= amount
      else
        puts "You don't have enough amount in your saving account. Your current balance is #{@saving_balance}. Deposit more money or enter less amount!!!"
      end
    end
  end

  def checking_Balance
    puts "Your current checking account balance is $#{@checking_balance}"
  end

  def saving_Balance
    puts "Your current saving account balance is $#{@saving_balance}"
  end

  def account_information
    puts "Account number: #{@accountNumber}"
    puts "Total amount in your account: $#{@checking_balance + @saving_balance}"
    puts "Checking account balance: $#{@checking_balance}"
    puts "Saving account balance: $#{@saving_balance}"
    puts "Interest rate: #{@interest_rate}%"
  end

  private
  def generate_account
    arr = []
    10.times.map {arr.push(rand(0..9))}
    return arr.join.to_i
  end
end

acc1 = BankAccount.new
# puts acc1.accountNumber
acc1.number_of_accounts
# acc1.account_information
acc1.deposit('C', 1000)
acc1.deposit('S', 500)
acc1.withdrawal('C', 1000)
acc1.account_information
acc1.withdrawal('C', 100)
acc1.account_information
