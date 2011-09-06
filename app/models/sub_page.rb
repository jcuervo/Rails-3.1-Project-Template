class SubPage < ActiveRecord::Base
  belongs_to :page
  
  def to_param
    self.browser_title.blank? ? "#{self.title.parameterize}" : "#{self.browser_title.parameterize}"
  end
end
