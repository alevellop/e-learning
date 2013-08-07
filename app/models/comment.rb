class Comment
  include Mongoid::Document

  field :author, type: String
  field :content, type: String

  #Necesario que esté al final del documento
  embedded_in :course, inverse_of: :comments
end
