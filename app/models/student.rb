class Student < ActiveRecord::Base
  searchkick conversions: "conversions"

  belongs_to :category
  has_many :searches, class_name: "Searchjoy::Search", foreign_key: "user_id"

  after_commit :reindex_cate

  scope :search_import, -> { includes(:category) }

  def search_data
    {
      name: name,
      address: address,
      age: age,
      email: email,
      category: category.name,
      conversions: searches.group(:query).uniq.count(:user_id)
    }
  end

  def should_index?
    active # only index active records
  end

  def reindex_cate
    category.reindex
  end
end
