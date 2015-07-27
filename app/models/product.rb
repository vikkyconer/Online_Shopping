class Product < ActiveRecord::Base
	validates :title, :description, :image_url, presence: true
	validates :price , numericality: {greater_than_or_equal_to: 0.01}
	validates :title, uniqueness: true
	validates :title, length: {minimum: 3}
	validates :image_url, allow_blank: true , format: {
		with: %r{\.(gif|jpg|png)$}i,
		message: 'must be a url for gif , jpg or png' 
	}

	has_many :line_items

	before_destroy :ensure_not_referenced_by_any_line_item

	private

	def ensure_not_referenced_by_any_line_item
		if line_items.empty?
			return true
		else
			errors.add(:base, 'Line Items Present')
			return false
		end
	end
end
