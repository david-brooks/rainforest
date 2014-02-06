class Product < ActiveRecord::Base
	has_many :reviews
  has_many :users, :through => :reviews

	validates_presence_of :description, :name, :url
	validates :price_in_cents, :numericality => {:only_integer => true}
  	
 
 def formatted_price
    price_in_dollars = price_in_cents.to_f / 100
    sprintf("%.2f", price_in_dollars)
  end

def self.search(search)
  if search
    find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
  else
    find(:all)
  end
end

end
