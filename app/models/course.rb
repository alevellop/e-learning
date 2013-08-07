class Course
  include Mongoid::Document

  has_and_belongs_to_many :users
  
  validates_uniqueness_of :title, {case_sensitive: true}
  validates_presence_of :title, :description, :language, :category, :price

  field :title, type: String
  field :description, type: String
  field :author, type: String
  field :language, type: String
  field :category, type: String
  field :image, type: String
  field :price, type: Integer
  field :bank_account, type: String

  #Necesario que esté al final del documento
  embeds_many :comments

end
