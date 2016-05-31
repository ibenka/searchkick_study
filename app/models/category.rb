class Category < ActiveRecord::Base
  searchkick

  has_many :students

end
