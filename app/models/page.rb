class Page < ActiveRecord::Base
  has_many :sub_pages
end
