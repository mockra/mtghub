class StarAddition
  attr_accessor :user, :deck

  def initialize user, deck
    @user, @deck = user, deck
  end

  def process
    create_star if !star_exists?
  end

  def create_star
    deck.stars.create user_id: user
  end

  def star_exists?
    deck.stars.find_by_user_id user
  end
end
