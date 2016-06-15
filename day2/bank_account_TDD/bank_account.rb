class BankAccount
  attr_reader :accountNumber, :checking_balance, :saving_balance, :interest_rate, :total_balance
  @@no_account = 0

  def initialize
    @checking_balance = 0
    @saving_balance = 0
    @total_balance = 0
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
      @total_balance += amount
    else
      @saving_balance += amount
      @total_balance += amount
    end
  end

  def withdrawal(account, amount)
    if account == 'C'
      if !(@checking_balance < amount)
        @checking_balance -= amount
        @total_balance -= amount
      else
        puts "You don't have enough amount in your checking account. Deposit more money or enter less amount!!!"
        raise 'Bad withdrawal request'
      end
    else
      if !(@saving_balance < amount)
        @saving_balance -= amount
        @total_balance -= amount
      else
        puts "You don't have enough amount in your saving account. Deposit more money or enter less amount!!!"
        raise 'Bad withdrawal request'
      end
    end
  end

  def display_checking
    puts "Your checking account balance is $#{@checking_balance}"
  end

  def display_saving
    puts "Your saving account balance is $#{@saving_balance}"
  end

  def account_information
    puts "Account number: #{@accountNumber}"
    puts "Total balance in your account: $#{@total_balance}"
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
