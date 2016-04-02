class User < ActiveRecord::Base
  
  has_many :user_stocks
  has_many :stocks, through: :user_stocks
  has_many :friendships
  has_many :friends, through: :friendships

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def full_name
    return "#{first_name} #{last_name}".strip if (first_name || last_name)
    "Anonymous"
  end

  def can_add_stock?(stock_symbol)
    stocks_under_limit? && !stock_already_exists?(stock_symbol)
  end

  def stocks_under_limit?
    (user_stocks.count < 10)
  end

  def stock_already_exists?(stock_symbol)
    stock = Stock.find_by_ticker(stock_symbol)
    return false unless stock
    user_stocks.where(stock_id: stock.id).exists?
  end 
end         
