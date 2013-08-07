class Course
  include Mongoid::Document
  field :title, type: String
  field :description, type: String
  field :author, type: String
  field :language, type: String
  field :category, type: String
  field :image, type: String
  field :price, type: Integer
  field :bank_account, type: String
end
