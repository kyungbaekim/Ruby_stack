require_relative 'bank_account'

RSpec.describe BankAccount do
  it 'has a method to display the checking account balance' do
    account = BankAccount.new
    account.deposit('C', 10000)
    expect(account.checking_balance).to eq(10000)
    account.deposit('C', 1000)
    expect(account.checking_balance).to eq(11000)
  end

  it 'has a method to display the total account balance' do
    account = BankAccount.new
    account.deposit('C', 10000)
    account.deposit('S', 1000)
    expect(account.total_balance).to eq(11000)
  end

  it 'has a method that allows the user to withdraw cash' do
    account = BankAccount.new
    account.deposit('C', 10000)
    expect(account.checking_balance).to eq(10000)
    account.withdrawal('C', 1000)
    expect(account.checking_balance).to eq(9000)
    account.withdrawal('C', 5000)
    expect(account.checking_balance).to eq(4000)
  end

  it 'raises an error if users try to withdraw more money than they have in the accout' do
    account = BankAccount.new
    account.deposit('C', 10000)
    expect {account.withdrawal('C', 10001)}.to raise_error(RuntimeError)
    account.deposit('S', 10000)
    expect {account.withdrawal('S', 10001)}.to raise_error(RuntimeError)
  end

  it 'raises an error when user tries to print out how many bank accounts there are' do
    account = BankAccount.new
    if expect {account.no_account}.to raise_error(NoMethodError)
      puts "Not authorized to access!!!"
    end
  end

  it 'raises an error when user tries to set the interest rate' do
    account = BankAccount.new
    if expect {account.interest_rate = 10}.to raise_error(NoMethodError)
      puts "You cannot change the interest rate!"
    else
      puts "Warning: No error raised!"
    end
  end

  it 'raises an error when user tries to set any attribute' do
    account = BankAccount.new
    if expect {account.checking_balance = 10}.to raise_error(NoMethodError)
      puts "You cannot change your checking account balance!"
    else
      puts "Warning: No error raised!"
    end
    if expect {account.saving_balance = 10}.to raise_error(NoMethodError)
      puts "You cannot change your saving account balance!"
    else
      puts "Warning: No error raised!"
    end
    if expect {account.total_balance = 10}.to raise_error(NoMethodError)
      puts "You cannot change the balance of your account!"
    else
      puts "Warning: No error raised!"
    end
    if expect {account.accountNumber = 10}.to raise_error(NoMethodError)
      puts "You cannot change your account number!"
    else
      puts "Warning: No error raised!"
    end
  end
end
