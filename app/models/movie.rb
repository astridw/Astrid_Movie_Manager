class Movie < ActiveRecord::Base
  validates :title, presence: true, length: { in: 2..50 }
  validates :length, presence: true, numericality: { greater_than: 0, less_than:500 }
  validates :release_year, presence: true, numericality: {greater_than: 1800, less_than:2100, only_integer: true }
  validates :rating, presence: true, inclusion: { in: [nil, 1,2,3,4,5],
    message: 'Please rate this movie between 1 and 5' }
    default_value_for :rating, nil
    include PgSearch
    pg_search_scope :search,
    against: [:title, :format, :length, :release_year, :rating],
    using: {
      tsearch: {dictionary: "english"}
    }
end
