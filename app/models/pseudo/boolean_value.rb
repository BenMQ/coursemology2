class Pseudo::BooleanValue
  include ActiveModel::Model
  include ActiveModel::Conversion

  attr_accessor :id, :value
end
