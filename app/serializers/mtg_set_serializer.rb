class MtgSetSerializer < ActiveModel::Serializer
  attributes :title, :code
  has_many :cards
end
