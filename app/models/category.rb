class Category < ApplicationRecord
  has_many :clients  

  before_destroy :must_not_refer_to_client

  private
    def must_not_refer_to_client
      unless line_items.empty?
        errors.add(:base, 'This category is being referenced by a client(s), either delete the client(s) first, or contact your administrator')
        throw :abort
      end
    end
end
