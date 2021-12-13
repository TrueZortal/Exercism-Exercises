module SavingsAccount
  def self.interest_rate(balance)
    interest_rate = 0
    if balance < 0
     interest_rate = -3.213
    elsif balance < 1000 and balance >= 0
      interest_rate = 0.5
    elsif balance >= 1000 and balance < 5000
      interest_rate = 1.621
    else
      interest_rate = 2.475
    end
  return interest_rate
  end

  def self.annual_balance_update(balance)
    balance + (balance.abs * self.interest_rate(balance)/100)
  end

  def self.years_before_desired_balance(current_balance, desired_balance)
  counter = 0
  @current_balance = current_balance
   until @current_balance >= desired_balance
     @current_balance += self.annual_balance_update(@current_balance)-@current_balance
     counter+= 1
   end
   puts counter
  end
end

SavingsAccount.years_before_desired_balance(100.0, 125.8)