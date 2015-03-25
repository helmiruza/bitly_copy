class Url < ActiveRecord::Base
  # Remember to create a migration!
  validates_format_of :original_url, :with => URI::regexp(%w(http https))

  before_save :generate_short_url
  def generate_short_url
  	self.short_url = (0...8).map { (65 + rand(26)).chr}.join unless self.short_url
  end
end
